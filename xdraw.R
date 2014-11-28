
losujPrezenty <- function(wszyscy, szczegó³y = FALSE) {
# Funkcja losuje kto komu ma kupiæ prezen
#
    kto <- 1:length(wszyscy)

    #wa¿ny moment losowania
    komu <- sample(kto)

    #dla wygody ³aczymy dane w jedn¹ tabelê
    kupuje <- data.frame(kto, komu)

    if (szczegó³y)
        print(kupuje)

    kupuje
}

jestPoprawne <- function(kupuje, szczegó³y = FALSE) {
# Funkcja sprawdzaj¹ca czy wynik losowania spe³nia kryteria poprawnoœci
#
    ile <- length(kupuje$kto)

    #wyliczamy i sprawdzamy warunki
    sobie <- kupuje$kto == kupuje$komu
    ¿onie <- kupuje$kto == kupuje$komu - ile/2
    mê¿owi <- kupuje$kto == kupuje$komu + ile/2
    if (szczegó³y) {
       print (sobie)
       print (¿onie)
       print (mê¿owi)
    }

    all(c(!sobie, !¿onie, !mê¿owi))
} 

losujPrezentyPoprawnie <- function(mê¿owie, ¿ony, wykres = NA, szczegó³y = FALSE) {
# Funkcja powtarza losowania do momentu uzyskania wyniku spe³niaj¹cego warunki poprawnoœci
#

    #sprawdŸ dane wejœciowe
    if (length(mê¿owie) != length(¿ony))
        stop("Liczba mê¿ów nie jest równa liczbie ¿on!")


    wszyscy <- c(mê¿owie, ¿ony)

    repeat {
        kupuje <- losujPrezenty(wszyscy)

        if (jestPoprawne(kupuje))
            break
    }

    if (!is.na(wykres)) {
        narysuj(kupuje, wszyscy, wykres)
    }

    data.frame(kto=wszyscy[kupuje$kto], komu=wszyscy[kupuje$komu])
}

narysuj <- function(kupuje, wszyscy, plik) {
# Funkcja przedstawia wyniki losowania w postaci wykresu i zapisuje go do pliku
#
    png(plik)
    plot(kupuje, axes=FALSE, pch=19, col="blue")
    points(kupuje$kto,kupuje$kto, pch=4, col="red")
    points(kupuje$kto,kupuje$kto+4, pch=4, col="red")
    points(kupuje$kto,kupuje$kto-4, pch=4, col="red")
    axis(1, at=1:length(wszyscy), wszyscy)
    axis(2, at=1:length(wszyscy), wszyscy)
    title("Œwiêta 20XX - przyk³adowy wynik")
    dev.off()
}

wypisz <- function(wynik) {
# Wypisuje wynik losowania w podziale na rodziny
#
    for (i in 1:(length(wynik$kto)/2)) {
        print(wynik[c(i,i+4),])
        message('')
    }

}

#dane wejœciowe
mê¿owie <- c("Henryk", "Jan", "Grzegorz", "Marek")
¿ony <- c("Apolonia", "Ela", "Agatka", "Ania")

#losowanie i prezentacja wyników
wynik <- losujPrezentyPoprawnie(mê¿owie, ¿ony, wykres="20XX.png")
print(wynik)

message("\nW postaci do wys³ania: ")
wypisz(wynik)

