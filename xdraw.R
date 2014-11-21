#dane wejœciowe
m¹¿ <- c("HS", "JS", "GS", "MS")
¿ona <- c("AS", "ES", "AG-S", "ASz")

#¿ony doklejamy do mê¿ów
wszyscy <- c(m¹¿, ¿ona)

#> wszyscy
#[1] "HS"   "JS"   "GS"   "MS"   "AS"   "ES"   "AG-S" "ASz" 

ile <- length(wszyscy)

#komputery wol¹ liczby niz inicja³y
kto <- 1:ile

repeat {
	#wa¿ny moment losowania
	komu <- sample(kto)

	#dla wygody ³aczymy dane w jedn¹ tabelê
	pary <- data.frame(kto, komu)

	#wyliczamy warunki
	sobie <- pary$kto == pary$komu
	¿onie <- pary$kto == pary$komu - ile/2
	mê¿owi <- pary$kto == pary$komu + ile/2

	#sprawdzamy czy wszystko jest OK
	ok <- all(!(sobie | ¿onie | mê¿owi))

	#jeœli OK to koñczymy losowania
	if (ok)
		break;
}

#prezentacja wyników losowania
wynik <- data.frame(kto=wszyscy[pary$kto], komu=wszyscy[pary$komu])
print(wynik)

# i jeszcze wykres
plot(pary, axes=FALSE, pch=19, col="blue")
points(kto,kto, pch=4, col="red")
points(kto,kto+4, pch=4, col="red")
points(kto,kto-4, pch=4, col="red")
axis(1, at=1:ile, wszyscy)
axis(2, at=1:ile, wszyscy)
title("Œwiêta 20XX - przyk³adowy wynik, nie rezultat")
