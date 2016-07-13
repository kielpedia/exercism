(ns robot-name)

(def ^:private alphabet "ABCDEFGHIJKLMNOPQRSTUVWXYZ")

(defn generate-name []
       (str
         (apply str (take 2 (repeatedly #(rand-nth alphabet))))
         (apply str (take 3 (repeatedly #(rand-int 10))))))

(defn robot []
      {})

(defn robot-name [robot]
      (if-not (contains? robot :name)
        (assoc robot :name (generate-name)))
      (get robot :name))

(defn reset-name [robot]
      (dissoc robot :name))