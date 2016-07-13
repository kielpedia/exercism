 (ns hamming
     (:require [clojure.string :refer [blank?]]))

 (defn distance [dna1 dna2]
       (when (= (count dna1) (count dna2))
         (->>
              (map not= dna1 dna2)
              (filter identity)
              (count))))