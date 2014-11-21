#dane wej�ciowe
m�� <- c("HS", "JS", "GS", "MS")
�ona <- c("AS", "ES", "AG-S", "ASz")

#�ony doklejamy do m��w
wszyscy <- c(m��, �ona)

#> wszyscy
#[1] "HS"   "JS"   "GS"   "MS"   "AS"   "ES"   "AG-S" "ASz" 

ile <- length(wszyscy)

#komputery wol� liczby niz inicja�y
kto <- 1:ile

repeat {
	#wa�ny moment losowania
	komu <- sample(kto)

	#dla wygody �aczymy dane w jedn� tabel�
	pary <- data.frame(kto, komu)

	#wyliczamy warunki
	sobie <- pary$kto == pary$komu
	�onie <- pary$kto == pary$komu - ile/2
	m�owi <- pary$kto == pary$komu + ile/2

	#sprawdzamy czy wszystko jest OK
	ok <- all(!(sobie | �onie | m�owi))

	#je�li OK to ko�czymy losowania
	if (ok)
		break;
}

#prezentacja wynik�w losowania
wynik <- data.frame(kto=wszyscy[pary$kto], komu=wszyscy[pary$komu])
print(wynik)

# i jeszcze wykres
plot(pary, axes=FALSE, pch=19, col="blue")
points(kto,kto, pch=4, col="red")
points(kto,kto+4, pch=4, col="red")
points(kto,kto-4, pch=4, col="red")
axis(1, at=1:ile, wszyscy)
axis(2, at=1:ile, wszyscy)
title("�wi�ta 20XX - przyk�adowy wynik, nie rezultat")