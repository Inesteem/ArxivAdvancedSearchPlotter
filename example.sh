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

./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2012 --endYear 2022 --title 'Paper Abstract containing TPU' \
    --showGraph \
    --graphFile './example_graph-2.pdf' \
    --keyWords "[('tpu','AND'),('tensor processing units', 'OR')]" \
    --graphLabels "TPU" \
    --plotType 'bars' \
    --searchInAbstract \
    --swapAxis 


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2012 --endYear 2022 --title 'Paper Title containing TPU' \
    --showGraph \
    --graphFile './example_graph-1.pdf' \
    --keyWords "[('tpu','AND'),('tensor processing units', 'OR')]" \
    --graphLabels "TPU" \
    --plotType 'bars' 

./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title refering to DL/NN + Resource Estimation' \
    --showGraph \
    --graphFile './example_graph.pdf' \
    --keyWords \
               "[\
               ('latency','AND'),('neural network','AND'),('estimat','AND'),\
               ('latency','OR'),('neural network','AND'),('predict','AND'),\
               ('latency','OR'),('deep learning','AND'),('estimat','AND'),\
               ('latency','OR'),('deep learning','AND'),('predict','AND'),\
                ]" \
               "[\
               ('time','AND'),('neural network','AND'),('estimat','AND'),\
               ('time','OR'),('neural network','AND'),('predict','AND'),\
               ('time','OR'),('deep learning','AND'),('estimat','AND'),\
               ('time','OR'),('deep learning','AND'),('predict','AND')\
                ]" \
               "[\
               ('power','AND'),('neural network','AND'),('estimat','AND'),\
               ('power','OR'),('neural network','AND'),('predict','AND'),\
               ('power','OR'),('deep learning','AND'),('estimat','AND'),\
               ('power','OR'),('deep learning','AND'),('predict','AND')\
                ]" \
               "[\
               ('energy','AND'),('neural network','AND'),('estimat','AND'),\
               ('energy','OR'),('neural network','AND'),('predict','AND'),\
               ('energy','OR'),('deep learning','AND'),('estimat','AND'),\
               ('energy','OR'),('deep learning','AND'),('predict','AND')\
                ]" \
               "[\
               ('memory','AND'),('neural network','AND'),('estimat','AND'),\
               ('memory','OR'),('neural network','AND'),('predict','AND'),\
               ('memory','OR'),('deep learning','AND'),('estimat','AND'),\
               ('memory','OR'),('deep learning','AND'),('predict','AND'),\
                ]" \
    --graphLabels "Latency" "Time" "Power" "Energy" "Memory"\
    --graphColors '#a6cee3' '#386cb0' '#e41a1c' '#fe9929' '#1b9e77' \
    --plotType 'line' 

./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2021 --title 'Paper Abstract containing DL or NN' \
    --showGraph \
    --graphFile './example_graph1.pdf' \
    --keyWords "[('deep learning','AND')]" \
               "[('neural network','AND')]" \
               "[('neural network','AND'),('deep learning','AND')]" \
               "[('deep learning','AND'),('neural network','OR')]" \
    --graphLabels "Deep Learning (DL)" "Neural Network (NN)" "NN AND DL" "NN OR DL" \
    --graphColors '#000017' '#b32428' '#b7d9b1' \
    --plotType 'line' \
    --searchInAbstract 





./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing NN or DL' \
    --showGraph \
    --graphFile './example_graph2.pdf' \
    --keyWords "[('deep learning','AND'),('neural networks', 'OR')]" \
    --graphLabels "DL and NN" \
    --plotType 'bars'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing Hardware + DL/NN' \
    --showGraph \
    --graphFile './example_graph3.pdf' \
    --keyWords "[('cpu', 'AND'),('deep learning','AND') ,('cpu',  'OR'),('neural network','AND'),
                    ('intel core', 'OR'),('deep learning','AND') ,('intel core',  'OR'),('neural network','AND'), \
                    ('xeon', 'OR'),('deep learning','AND') ,('xeon',  'OR'),('neural network','AND'), \
                    ('processor', 'OR'),('deep learning','AND') ,('processor',  'OR'),('neural network','AND')  ]" \
                "[('gpu', 'AND'),('deep learning','AND') ,('gpu',  'OR'),('neural network','AND')  ]" \
                "[('asic', 'AND'),('deep learning','AND'),('asic', 'OR'),('neural network','AND'), \
                    ('tensor processing unit', 'OR'),\
                    ('neural processing unit', 'OR'),\
                    ('neural processor', 'OR'),\
                    ('neural compute stick', 'OR'),\
                    ('TPU', 'OR'),\
                    ('movidius','OR'),\
                    ('neural network processor', 'OR'),\
                    ('intelligence processing unit', 'OR')]" \
                "[('fpga', 'AND'),('deep learning','AND'),('fpga', 'OR'),('neural network','AND'), \
                 ('stratix', 'OR'),('deep learning','AND'),('stratix', 'OR'),('neural network','AND'),\
                 ('agilex', 'OR'),('deep learning','AND'),('agilex', 'OR'),('neural network','AND')]" \
                "[('SoC', 'AND'),('deep learning','AND'),('SoC', 'OR'),('neural network','AND'), \
                 ('nvidia tegra', 'OR'),('deep learning','AND'),('nvidia tegra', 'OR'),('neural network','AND'), \
                 ('nvidia jetson', 'OR'),('deep learning','AND'),('nvidia jetson', 'OR'),('neural network','AND'), \
                 ('nvidia jetson nano', 'OR')]" \
    --graphLabels "CPU" "GPU" "ASIC" "FPGA" "SoC" \
    --graphColors '#1b9e77' '#d95f02' '#7570b3' '#e7298a' '#66a61e' \
    --plotType 'line'

./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing SW/HW + DL/NN' \
    --showGraph \
    --graphFile './example_graph4.pdf' \
    --keyWords "[('hardware', 'AND'),('deep learning','AND'),('hardware',  'OR'),('neural network','AND')  ]" \
                "[('software', 'AND'),('deep learning','AND') ,('software',  'OR'),('neural network','AND')  ]" \
    --graphLabels "HW" "SW" \
    --plotType 'line'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing SW/HW Accelerators + DL/NN' \
    --showGraph \
    --graphFile './example_graph5.pdf' \
    --keyWords "[('hardware', 'AND'),('deep learning','AND'),('accelerator','AND'), ('hardware',  'OR'),('neural network','AND'),('accelerator','AND')  ]" \
                "[('software', 'AND'),('deep learning','AND'),('accelerator','AND') ,('software',  'OR'),('neural network','AND'),('accelerator','AND')  ]" \
    --graphLabels "HW" "SW" \
    --plotType 'line'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing IoT + DL/NN' \
    --showGraph \
    --graphFile './example_graph6.pdf' \
    --keyWords \
        "[\
        ('phone', 'AND'),('deep learning','AND'),('phone',  'OR'),('neural network','AND'), \
        ('handy', 'AND'),('deep learning','AND'),('handy',  'OR'),('neural network','AND')\
]" \
        "[\
        ('iot', 'AND'),('deep learning','AND') ,('iot',  'OR'),('neural network','AND'),\
        ('internet of things', 'AND'),('deep learning','AND') ,('internet of things',  'OR'),('neural network','AND')\
        ]" \
        "[\
        ('car', 'AND'),('deep learning','AND') ,('car',  'OR'),('neural network','AND'),\
        ('vehicle', 'AND'),('deep learning','AND') ,('vehicle',  'OR'),('neural network','AND')\
        ]" \
        "[\
        ('mobile', 'AND'),('deep learning','AND') ,('mobile',  'OR'),('neural network','AND')\
        ]" \
    --graphLabels "Phones" "IoT" "Cars" "Mobile" \
    --plotType 'line'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing Cloud/Edge/Fog Computing + DL/NN' \
    --showGraph \
    --graphFile './example_graph7.pdf' \
    --keyWords \
        "[\
        ('cloud computing','AND'),('deep learning','AND'),('cloud computing','OR'),('neural network','AND')
]" \
        "[\
        ('edge computing','AND'),('deep learning','AND'),('edge computing','OR'),('neural network','AND')
        ]" \
        "[\
        ('fog computing','AND'),('deep learning','AND'),('fog computing','OR'),('neural network','AND')
        ]" \
    --graphLabels "Cloud" "Edge" "Fog" \
    --plotType 'line'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2010 --endYear 2022 \
    --title '' \
    --showGraph \
    --graphFile './example_graph8.pdf' \
    --keyWords \
        "[\
        ('real-time','AND'),('deep learning','AND'), \
        ('real-time','OR'),('neural network','AND'), \
        ('real time','OR'), ('deep learning','AND'), \
        ('real time','OR'),('neural network','AND') \
        ]" \
        "[\
        ('real-time','AND'),('embedded','AND'), \
        ('real time','OR'),('embedded','AND'), \
        ('real-time','OR'),('mobile','AND'), \
        ('real time','OR'),('mobile','AND'), \
        ('real-time','OR'),('edge','AND'), \
        ('real time','OR'),('edge','AND'), \
        ]" \
        "[\
        ('real-time','AND'),('deep learning','AND'),('embedded','AND'), \
        ('real-time','OR'),('neural network','AND'),('embedded','AND'), \
        ('real time','OR'),('deep learning','AND'), ('embedded','AND'), \
        ('real time','OR'),('neural network','AND'),('embedded','AND'),\
        ('real-time','OR'),('deep learning','AND'), ('mobile','AND'), \
        ('real-time','OR'),('neural network','AND'),('mobile','AND'), \
        ('real time','OR'),('deep learning','AND'), ('mobile','AND'), \
        ('real time','OR'),('neural network','AND'),('mobile','AND'), \
        ('real-time','OR'),('deep learning','AND'), ('edge','AND'), \
        ('real-time','OR'),('neural network','AND'),('edge','AND'), \
        ('real time','OR'),('deep learning','AND'), ('edge','AND'),  \
        ('real time','OR'),('neural network','AND'),('edge','AND'), \
]" \
    --graphLabels "RT+DL" "Embedded RT"  "Embedded RT+DL"\
    --plotType 'line' \
    --swapAxis


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Abstract containing Real Time + DL' \
    --showGraph \
    --graphFile './example_graph9.pdf' \
    --keyWords \
        "[\
        ('real-time', 'AND'),('deep learning','AND'),('real-time',  'OR'),('neural network','AND'), \
        ('real time', 'OR'),('deep learning','AND'),('real time',  'OR'),('neural network','AND')\
        ]" \
        "[\
        ('real-time', 'AND'),('deep learning','AND'),('embedded','AND'), ('real-time',  'OR'),('neural network','AND'),('embedded','AND'), \
        ('real time', 'OR'),('deep learning','AND'), ('embedded','AND'), ('real time',  'OR'),('neural network','AND'), ('embedded','AND'),\
]" \
    --graphLabels "RT" "Embedded RT" \
    --searchInAbstract \
    --plotType 'bars'
