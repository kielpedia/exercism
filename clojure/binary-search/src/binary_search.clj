(ns binary-search)

(defn middle [vector]
      (quot (count vector) 2))

(defn search-for [item vector]
       (let [index (middle vector)
             value (nth vector index)]
            (if (= item value)
              index
              (cond
                (= 1 (count vector)) (throw (Exception. "not found"))
                (> value item) (search-for item (first (split-at index vector)))
                (< value item) (+ index (search-for item (second (split-at index vector))))))))
