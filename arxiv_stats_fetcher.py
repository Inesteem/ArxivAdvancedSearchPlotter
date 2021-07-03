#!/usr/bin/python3
import requests 
from enum import IntEnum

import hashlib
from bs4 import BeautifulSoup #dependency: pip3 install BeautifulSoup4
from urllib.request import urlopen
import re
import sys

import argparse  #dependeny pip3 install matplotlib
import copy

import math
import matplotlib.pyplot as plt
import matplotlib.ticker as mtick

from matplotlib.colors import Colormap

import numpy as np

import pickle
HOST="https://arxiv.org/"
SEARCH="search/advanced?advanced="


colormap = [
    '#4477AA', #0
    '#99CCEE', #1
    '#AA3377', #2
    '#DDCC77', #3
    '#BB5566', #4
    '#117733', #5
    '#BBBBBB'  #6
    ]

figuresize = (
    (10.0, 2.6),
    (10.0, 4.0),
    (5.0, 3.0),
)

def setDefaultStyle():
    plt.rcParams['figure.titleweight'] = 'bold'
    plt.rcParams['figure.figsize'] = figuresize[0]
    plt.rcParams['lines.linewidth'] = 1

    plt.rcParams['axes.titleweight'] = 'bold'
    plt.rcParams['axes.titlesize'] = 'medium'

    plt.rcParams['font.weight'] = 'bold'

    plt.rcParams['axes.labelweight'] = 'bold'
    plt.rcParams['xtick.labelsize'] = 'smaller'
    plt.rcParams['ytick.labelsize'] = 'smaller'

    # See available rcParams
    # plt.rcParams.keys


class DateType(IntEnum):
    SUBMITTED_DATE=0
    SUBMITTED_DATE_FIRST=1
    ANNOUNCED_DATE_FIRST=1
    def __str__(self):
        return self.name.lower()



class ResearchArea(IntEnum):
    COMPUTER_SCIENCE = 0
    ECONOMICS = 1
    EESS = 2
    MATHEMATICS = 3
    PHYSICS = 4
    PHYSICS_ARCHIVES = 5
    Q_BIOLOGY = 6
    Q_FINANCE = 7
    STATISTICS = 8
    INCLUDE_CROSS_LIST = 9

    def __str__(self):
        return self.name.lower()

class Filter(IntEnum):
    SPECIFIC_YEAR= 0
    PAST_12 =1
    ALL_DATES=2
    DATE_RANGE=3
    def __str__(self):
        return self.name.lower()

class NeedleField(IntEnum):
    ALL = 0
    TITLE = 1
    ABSTRACT = 2
    def __str__(self):
        return self.name.lower()


class Needle(object):
    def __init__(self, op, msg, field):
        self.op = op
        self.msg = msg
        self.field = field

class Research(object):
    def __init__(self, area, field):
        self.area = area 
        self.field = field



def  plot_graph(x, ys, args):
    labels = args.graphLabels
    plot_type = args.plotType
    title = args.title
#    f = open(filename, "r")
#    x, y, y2 = np.loadtxt(f, unpack=True, usecols=(0, 1, 2))
#    f.close()


    x_max = max(x)
    x_min = min(x)
    y_min = 0    
    y_max = np.max(ys)

    fig, ax = plt.subplots()
    ax.set_xlabel('Years',fontsize=16,labelpad=10)
    ax.set_xticks(x[::2])
    ax.set_xticklabels([int(l) for l in x[::2]], rotation=45)

    if args.swapAxis:
        ax1 = ax
        ax=ax.twinx()
        ax1.set_yticks([])
        ax.set_ylabel('Paper Submissions',fontsize=16,labelpad=20, rotation=270)
    else:
        ax.set_ylabel('Paper Submissions',fontsize=16,labelpad=10)

    #ax.xlim(x_min,x_max)
    #ax.ylim(y_min,y_max)
#    plt.title('Paper first submissions of the last 2 decades')
    plt.title(title)
    for i,(y,label) in enumerate(zip(ys,labels)):
        if plot_type=='bars':
            p = plt.bar(x, y, align='center', label=label, color=colormap[i], zorder=i)
        else:
            p = plt.plot(x, y, marker='o', linestyle='solid',linewidth=2, markersize=2.5, color=colormap[i], label=label)

    plt.legend(loc='upper left',fontsize=13)

    plt.tight_layout()
    plt.savefig(args.graphFile)
    if args.showGraph:
        plt.show()

class ArxivQuery(object):

    def __init__(self, year=2020, from_date = '', to_date = '', include_c_l=True):
        self.needles = []
        self.research = []
        #papers that are originally ment for another category but are from interest for the selected
        #ones too
        self.include_cross_list=include_c_l 
        self.year = year 
        self.from_date = from_date
        self.to_date = to_date 

    def add_needle(self,msg,op,fields):
        for field in fields:
            if len(self.needles) == 0:
                op = "AND"
            self.needles.append(Needle(op, msg.replace(" ", "+"), str(field)))
    
    def add_research_area(self,area,field='y'):
        self.research.append(Research(str(area),field))

    def add_ra_physics(self, field="all"):
        self.add_research_area(ResearchArea.PHYSICS)
        self.add_research_area(ResearchArea.PHYSICS_ARCHIVES, field)

    def build_url(self, filter_by, date_type):
        url = HOST + SEARCH

        for i, needle in enumerate(self.needles):
           url += "&terms-%d-operator=%s"   % (i, needle.op)
           url += "&terms-%d-term=%s"       % (i, "\""+needle.msg+"\"")
           url += "&terms-%d-field=%s"      % (i, needle.field) 
        
        for research in self.research:
           url += "&classification-%s=%s"   % (research.area, research.field)

        url += "&classification-include_cross_list="
        if self.include_cross_list:
           url += "include"
        else:
           url += "exclude"

        url+="&date-filter_by=%s" % str(filter_by)
        url+="&date-year=%d" % self.year
        url+="&date-from_date=%s" % self.from_date
        url+="&date-to_date=%s" % self.from_date
        
        url+="&date-date_type=%s" % date_type

        url += "&abstracts=hide&size=50"
        #url += "&abstracts=show&size=50"
        url += "&order=-announced_date_first"

        return url



class ResearchAreaOption(object):
    def __init__(self, arg_str, arg_help, res_area, get_arg=lambda args : None):
        self.arg_str  = arg_str 
        self.arg_help = arg_help
        self.res_area = res_area
        self.get_arg  = get_arg 

researchAreas = [
        ResearchAreaOption('--raCS',  'Subject: Computer Science', ResearchArea.COMPUTER_SCIENCE, lambda args : args.raCS),
        ResearchAreaOption('--raMath',  'Subject: Mathematics', ResearchArea.MATHEMATICS, lambda args : args.raMath),
        ResearchAreaOption('--raStats',  'Subject: Statistics', ResearchArea.STATISTICS, lambda args : args.raStats),
        ResearchAreaOption('--raPhysics',  'Subject: Physics (all)', ResearchArea.PHYSICS, lambda args : args.raPhysics),
        ResearchAreaOption('--raEcon',  'Subject: Economics', ResearchArea.ECONOMICS, lambda args : args.raEcon),
        ResearchAreaOption('--raEESS',  'Subject: Electrical Engineering and Systems Science', ResearchArea.EESS, lambda args : args.raEESS),
        ResearchAreaOption('--raQBio',  'Subject: Quantitative Biology', ResearchArea.Q_BIOLOGY, lambda args : args.raQBio),
        ResearchAreaOption('--raQFin',  'Subject: Quantitative Finance', ResearchArea.Q_FINANCE, lambda args : args.raQFin),
        ResearchAreaOption('--raALL',   'Subject: All', None, lambda args : args.raALL),
     ]


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
          '--startYear', help='start year (incl)', type=int, default=1991)
    parser.add_argument(
          '--endYear', help='end year (excl)', type=int, default=2020)
    parser.add_argument(
          '--title', help='graph title', type=str, default="")
    parser.add_argument(
            '--plotType', help="Plot: 'bars' or 'lines'(default)", type=str, default="lines")
    parser.add_argument(
          '--graphFile', help='Path to graph file to save the plot', type=str, default="/tmp/graph.png")
    parser.add_argument(
          "--showGraph", help="show graph after plotting with eog",  required=False, action='store_true')
    parser.add_argument(
          "--keyWords", help="list of keyword,con pairings for each graph; format: [('word1_graph1','con11'),..('wordm_graph1','con1m')] ... [('word1_graphn','conn1'),..('wordk_graphn','connk')], where con='OR' or 'AND' and word is the keyword you search for", required=True , nargs='+')
    parser.add_argument(
          "--graphLabels", help="graph labels; format: 'label1' 'label2' ... 'labeln'", required=True, nargs='+')
    parser.add_argument(
            "--graphColors", help="list of graph colors", required=False, nargs='+')

    parser.add_argument(
            "--searchInAbstract", help="search in abstract for key words (default: title)", required=False, action='store_true')
 
    parser.add_argument(
            "--swapAxis", help="use y2 axis instead of y", required=False, action='store_true')
  
    for ra in researchAreas:
        parser.add_argument(ra.arg_str, help=ra.arg_help, required=False, action='store_true')

    args = parser.parse_args()
   
    assert(len(args.graphLabels) == len(args.keyWords));

    
    # set colors ( if available )
    if args.graphColors:
        for i,c in enumerate(args.graphColors):
            colormap[i] = c


   # cache query results
    dict_file = ".query_dict"
    try:
        query_dict = pickle.load(open(dict_file, "rb"))
    except Exception as e:
        query_dict = {}
        print(e)

    # build query object
    query = ArxivQuery()
    for ra in researchAreas:
        if ra.arg_str:
            continue
        if args.RA_All or ra.get_arg(args):
            query.add_research_area(ra.res_area)

    if args.searchInAbstract: 
        needle_fields=[NeedleField.ABSTRACT]
    else:
        needle_fields=[NeedleField.TITLE]
   

    query_needles = []
    #eval is evil; only use it if you your self define the input
    for kw in args.keyWords:
        query_needles.append(eval(kw))

    #print(query_needles)
    queries = []

    for needles in query_needles:
        query_tmp = copy.deepcopy(query)
        for needle,op in needles:
            query_tmp.add_needle(needle,op,needle_fields)
        queries.append(query_tmp)


    lists = []
    years = np.arange(max(1900,args.startYear),args.endYear)
    for query in queries:
        paper_list = []
        for year in range(years[0],years[-1]+1):
            query.year = year 
            url = query.build_url(Filter.SPECIFIC_YEAR, DateType.SUBMITTED_DATE_FIRST)
            print(url)
            url_hash=hashlib.md5(url.encode('utf-8')).hexdigest()
            if url_hash not in query_dict:
                with urlopen(url) as response:
                    soup = BeautifulSoup(response, 'html.parser')
                    search_result = soup.h1.get_text()
                    if "Sorry, your query returned no results" in search_result:
                        query_dict[url_hash]  = 0
                    else:
                        try: 
                            search_result = re.findall("of ([0-9]*[,[0-9]+]*) result",search_result)
                            search_result = int(search_result[0].replace(',',''))
                            query_dict[url_hash] = search_result
                        except Exception as e:
                            query_dict[url_hash]  = -1
                            print(e)

            print(str(year) + " " + str(query_dict[url_hash]))
            paper_list.append(query_dict[url_hash])
        lists.append(paper_list)
    pickle.dump(query_dict, open(dict_file, "wb"))


    lists= np.array(lists)


    plot_graph(years, lists, args)

