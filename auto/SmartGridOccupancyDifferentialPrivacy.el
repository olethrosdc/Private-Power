(TeX-add-style-hook
 "SmartGridOccupancyDifferentialPrivacy"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-class-options
                     '(("article" "a4paper" "onecolumn")))
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("color" "usenames" "dvipsnames") ("todonotes" "textsize=small") ("geometry" "margin=3.5cm")))
   (TeX-run-style-hooks
    "latex2e"
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
    "geometry")
   (TeX-add-symbols
    '("christosm" 1)
    '("maryamm" 1)
    '("christos" 1)
    '("maryam" 1)
    '("cset" 2)
    '("abs" 1)
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
    "demand"
    "Demand"
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
    "eq:differential-privacy"
    "fig:local-neighbourhood"
    "eq:exponential mechanism")
   (LaTeX-add-environments
    "lem"
    "thm"
    "prop"
    "defi"
    "problem"
    "assume"
    "corollary"
    "claim"
    "fact"
    "remark"
    "example"
    "obs")
   (LaTeX-add-bibliographies
    "references")))

