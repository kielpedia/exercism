(ns grade-school)

(defn add [db name grade]
      (let [current (get db grade [])]
           (assoc db grade (conj current name))))

(defn grade [db grade]
      (get db grade []))

(defn sorted [db]
      (->>
        (into {} (for [[k v] db] [k (into [] (sort v)) ]))
        (into (sorted-map))))
