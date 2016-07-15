(ns robot-name)

(def ^:private alphabet (map char (range (int \A) (int \Z))))

(defn- generate-uuid []
       (.toString (java.util.UUID/randomUUID)))

(defn- generate-name []
       (str
         (apply str (take 2 (repeatedly #(rand-nth alphabet))))
         (apply str (take 3 (repeatedly #(rand-int 10))))))

(defn robot []
      (ref {:name (generate-name)}))

(defn robot-name [robot]
      (get @robot :name))

(defn reset-name [robot]
      (dosync
        (ref-set robot (assoc @robot :name (generate-name)))))