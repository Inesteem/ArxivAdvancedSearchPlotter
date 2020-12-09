#!/bin/bash

./arxiv_stats_fetcher.py \
    --raCS \
    --startYear 2000 --endYear 2021 --title 'Paper containing DL or NN' \
    --showGraph \
    --graphFile './example_graph.png' \
    --keyWords "[('Deep Learning','AND')]" \
               "[('Neural Network','AND')]" \
               "[('Neural Network','AND'),('Deep Learning','AND')]" \
               "[('Deep Learning','AND'),('Neural Network','OR')]" \
    --graphLabels "Deep Learning (DL)" "Neural Network (NN)" "NN AND DL" "NN OR DL" \
    --graphColors '#000017' '#b32428' '#b7d9b1' \
    --plotType 'line'

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
#
