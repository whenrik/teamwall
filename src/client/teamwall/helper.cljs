(ns teamwall.helper
  "Various helper functions for teamwall that don't belong to a specific namespace"
  (:require [goog.net.cookies :as gcookies]
            [cljs.reader :as reader]))

(defn get-cookie
  "Return the document cookie named COOKIE-NAME.
  Return nil if no cookie is found"
  [cookie-name]
  (or (.get goog.net.cookies (name cookie-name)) 
      nil))
