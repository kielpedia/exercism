(ns meetup
    (:require [clj-time]))

(defn meetup [month year day occurence]
      (-> (.of)
          (.withMonth month)
          (.withYear year)))