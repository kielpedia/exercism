(ns etl
    (:require [clojure.string :refer [lower-case]]))

(defn transform [legacy]
      (apply merge-with merge
             (for [[ok ov] legacy
                   iv ov]
                  {(lower-case iv) ok})))


