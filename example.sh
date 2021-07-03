#!/bin/bash

#    --raCS \ #research area of: Computer Science 
#    --startYear 2000 --endYear 2021 --title 'Paper containing DL or NN' \
#    --showGraph \ #open graph file with eog (ony works for pngs)
#    --graphFile './example_graph.png'\ #file name of saved graph file
#    --keyWords "[('Deep Learning','AND')]" \  #Paper with DL in title
#               "[('Neural Network','AND')]" \ #Paper with NN in title
#               "[('Neural Network','AND'),('Deep Learning','AND')]" \ #Paper with both in title 
#               "[('Deep Learning','AND'),('Neural Network','OR')]" \ #Paper with any of NN or DL in title
#    --graphLabels "Deep Learning (DL)" "Neural Network (NN)" "NN AND DL" "NN OR DL"\ #graph names
#    --graphColors '#000017' '#b32428' '#b7d9b1'\ #optional
#    --plotType 'line' #either line (default) or bars
#    --searchInAbstract # default: search in title

./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing NN or DL' \
    --showGraph \
    --graphFile './example_graph2.png' \
    --keyWords "[('deep learning','AND'),('neural networks', 'OR')]" \
    --graphLabels "DL and NN" \
    --graphColors '#000017' '#b32428' '#b7d9b1' \
    --plotType 'bars'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2021 --title 'Paper Abstract containing DL or NN' \
    --showGraph \
    --graphFile './example_graph.png' \
    --keyWords "[('Deep Learning','AND')]" \
               "[('Neural Network','AND')]" \
               "[('Neural Network','AND'),('Deep Learning','AND')]" \
               "[('Deep Learning','AND'),('Neural Network','OR')]" \
    --graphLabels "Deep Learning (DL)" "Neural Network (NN)" "NN AND DL" "NN OR DL" \
    --graphColors '#000017' '#b32428' '#b7d9b1' \
    --plotType 'line' \
    --searchInAbstract 


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing Hardware + DL/NN' \
    --showGraph \
    --graphFile './example_graph3.png' \
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
    --plotType 'line'

./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing SW/HW + DL/NN' \
    --showGraph \
    --graphFile './example_graph4.png' \
    --keyWords "[('hardware', 'AND'),('deep learning','AND'),('hardware',  'OR'),('neural network','AND')  ]" \
                "[('software', 'AND'),('deep learning','AND') ,('software',  'OR'),('neural network','AND')  ]" \
    --graphLabels "HW" "SW" \
    --plotType 'line'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing SW/HW Accelerators + DL/NN' \
    --showGraph \
    --graphFile './example_graph5.png' \
    --keyWords "[('hardware', 'AND'),('deep learning','AND'),('accelerator','AND'), ('hardware',  'OR'),('neural network','AND'),('accelerator','AND')  ]" \
                "[('software', 'AND'),('deep learning','AND'),('accelerator','AND') ,('software',  'OR'),('neural network','AND'),('accelerator','AND')  ]" \
    --graphLabels "HW" "SW" \
    --plotType 'line'


./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2022 --title 'Paper Title containing IoT + DL/NN' \
    --showGraph \
    --graphFile './example_graph6.png' \
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
    --graphFile './example_graph7.png' \
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
