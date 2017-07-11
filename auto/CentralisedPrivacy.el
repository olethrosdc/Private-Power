(TeX-add-style-hook
 "CentralisedPrivacy"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "onecolumn")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("color" "usenames" "dvipsnames") ("todonotes" "textsize=small") ("geometry" "margin=3.5cm")))
   (TeX-run-style-hooks
    "latex2e"
    "src/price-utility"
    "src/epsilon-utility"
    "src/epsilon-price"
    "article"
    "art10"
    "amsmath"
    "amssymb"
    "amsthm"
    "amsfonts"
    "graphicx"
    "subfigure"
    "subfigmat"
    "framed"
    "color"
    "todonotes"
    "algorithm"
    "algorithmic"
    "enumerate"
    "url"
    "geometry"
    "pgfplots"
    "grffile")
   (TeX-add-symbols
    '("christosm" 1)
    '("maryamm" 1)
    '("christos" 1)
    '("maryam" 1)
    '("cset" 2)
    '("abs" 1)
    "loss"
    "util"
    "Z"
    "Prob"
    "CS"
    "CZ"
    "R"
    "N"
    "B"
    "gam"
    "bb"
    "oo"
    "lam"
    "al"
    "eps"
    "del"
    "sig"
    "sgn"
    "m"
    "mb"
    "ask"
    "demand"
    "mdemand"
    "elas"
    "Demand"
    "fdemand"
    "price"
    "cost"
    "nmech"
    "dpmech"
    "neigh"
    "sense"
    "lmech"
    "emech"
    "pmech"
    "baseline"
    "Laplace")
   (LaTeX-add-labels
    "sec:introduction"
    "sec:bertr-model-electr"
    "sec:privacy-model"
    "sec:priv-cons-mech"
    "eq:exponential-price"
    "fig:price-util"
    "fig:eps-util"
    "fig:eps-price"
    "fig:utility"
    "sec:cournot-model"
    "eq:loss"
    "eq:price"
    "eq:cost"
    "eq:equilibrium-utility")
   (LaTeX-add-environments
    "lemma"
    "theorem"
    "proposition"
    "corollary"
    "fact"
    "definition"
    "assumption"
    "example"
    "remark")))

