#!/bin/bash

#    --raCS \ #research area of: Computer Science 
#    --startYear 2000 --endYear 2021 --title 'Paper containing DL or NN' \
#    --showGraph \ #open graph file with eog (ony works for pdfs)
#    --graphFile './example_graph.pdf'\ #file name of saved graph file
#    --keyWords "[('deep learning','AND')]" \  #Paper with DL in title
#               "[('neural network','AND')]" \ #Paper with NN in title
#               "[('neural network','AND'),('deep learning','AND')]" \ #Paper with both in title 
#               "[('deep learning','AND'),('neural network','OR')]" \ #Paper with any of NN or DL in title
#    --graphLabels "deep learning (DL)" "neural network (NN)" "NN AND DL" "NN OR DL"\ #graph names
#    --graphColors '#000017' '#b32428' '#b7d9b1'\ #optional
#    --plotType 'line' #either line (default) or bars
#    --searchInAbstract # default: search in title

../arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing "deep learning" or "neural network"' \
    --showGraph \
    --graphFile './example_graph2.pdf' \
    --keyWords "[('deep learning','AND'),('neural network', 'OR')]" \
    --noLegend \
    --addYGrid \
    --plotType 'bars'



../arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title refering to DL/NN + Resource' \
    --showGraph \
    --graphFile './example_graph.pdf' \
    --keyWords \
               "[\
               ('time','AND'),('neural network','AND'),\
               ('time','OR'),('deep learning','AND'),\
               ('latency','OR'),('neural network','AND'),\
               ('latency','OR'),('deep learning','AND'),\
                ]" \
               "[\
               ('power','AND'),('neural network','AND'),\
               ('power','OR'),('deep learning','AND'),\
                ]" \
               "[\
               ('energy','AND'),('neural network','AND'),\
               ('energy','OR'),('deep learning','AND'),\
                ]" \
               "[\
               ('memory','AND'),('neural network','AND'),\
               ('memory','OR'),('deep learning','AND'),\
                ]" \
    --graphLabels "Latency/Time" "Power" "Energy" "Memory"\
    --graphColors '#386cb0' '#e41a1c' '#fe9929' '#1b9e77'\
    --addYGrid \
    --plotType 'line'


../arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title refering to Natural Language Processing' \
    --showGraph \
    --graphFile './example_graph4.pdf' \
    --keyWords \
               "[\
               ('natural language processing','AND'),('neural language processing','OR'),('neural language understanding','OR'),('speech recognition','OR'),('natural language generation','OR'),('natural-language processing','OR'),('neural-language processing','OR'),('neural-language understanding','OR'),('speech-recognition','OR'),('natural-language generation','OR'),(' NLP','OR'),\
                ]" \
    --noLegend \
    --addYGrid \
    --graphColors '#386cb0' '#e41a1c' '#fe9929' '#1b9e77'\
    --plotType 'bars'
