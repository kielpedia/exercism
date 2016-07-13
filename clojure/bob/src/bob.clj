(ns bob
    (:require [clojure.string :refer [upper-case ends-with? blank?]]))

(defn response-for [q]
      (cond
        (blank? q) "Fine. Be that way!"
        (and (re-find #"[a-zA-Z]" q) (= q (upper-case q)) ) "Whoa, chill out!"
        (ends-with? q "?") "Sure."
        :else "Whatever."))

