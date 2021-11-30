; ===================================================
; File: tubes-2.CLP
; Description: Breast cancer detector
; ===================================================

(defrule start
=>
(assert (phase start))
)

(defrule enter-message
?phase <- (phase start)
=>
(retract ?phase)
(printout t crlf "Mean concave points: ")
(assert (mean-concave-points  (read)))
(printout t crlf "Worst concave points: ")
(assert (worst-concave-points (read)))
(printout t crlf "Concave points error: ")
(assert (concave-points-error (read)))
(printout t crlf "Mean radius: ")
(assert (mean-radius (read)))
(printout t crlf "Worst radius: ")
(assert (worst-radius (read)))
(printout t crlf "Radius error: ")
(assert (radius-error (read)))
(printout t crlf "Mean texture: ")
(assert (mean-texture (read)))
(printout t crlf "Worst texture: ")
(assert (worst-texture (read)))
(printout t crlf "Worst area: ")
(assert (worst-area (read)))
(printout t crlf "Mean smoothness: ")
(assert (mean-smoothness (read)))
(printout t crlf "Worst perimeter: ")
(assert (worst-perimeter (read)))
(printout t crlf "Perimeter error: ")
(assert (perimeter-error (read)))
)

(defrule positive-cancer
?result <- (result 1)
=>
(retract ?result)
(printout t "Hasil Prediksi = Terprediksi Kanker Payudara")
)

(defrule negative-cancer
?result <- (result 0)
=>
(retract ?result)
(printout t "Hasil Prediksi = Terprediksi Tidak Kanker Payudara")
)

