
losujPrezenty <- function(wszyscy, szczeg�y = FALSE) {
# Funkcja losuje kto komu ma kupi� prezen
#
    kto <- 1:length(wszyscy)

    #wa�ny moment losowania
    komu <- sample(kto)

    #dla wygody �aczymy dane w jedn� tabel�
    kupuje <- data.frame(kto, komu)

    if (szczeg�y)
        print(kupuje)

    kupuje
}

jestPoprawne <- function(kupuje, szczeg�y = FALSE) {
# Funkcja sprawdzaj�ca czy wynik losowania spe�nia kryteria poprawno�ci
#
    ile <- length(kupuje$kto)

    #wyliczamy i sprawdzamy warunki
    sobie <- kupuje$kto == kupuje$komu
    �onie <- kupuje$kto == kupuje$komu - ile/2
    m�owi <- kupuje$kto == kupuje$komu + ile/2
    if (szczeg�y) {
       print (sobie)
       print (�onie)
       print (m�owi)
    }

    all(c(!sobie, !�onie, !m�owi))
} 

losujPrezentyPoprawnie <- function(m�owie, �ony, wykres = NA, szczeg�y = FALSE) {
# Funkcja powtarza losowania do momentu uzyskania wyniku spe�niaj�cego warunki poprawno�ci
#

    #sprawd� dane wej�ciowe
    if (length(m�owie) != length(�ony))
        stop("Liczba m��w nie jest r�wna liczbie �on!")


    wszyscy <- c(m�owie, �ony)

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
    title("�wi�ta 20XX - przyk�adowy wynik")
    dev.off()
}

wypisz <- function(wynik) {
# Wypisuje wynik losowania w podziale na rodziny
#
    ile <- length(wynik$kto)/2

    for (i in 1:ile) {
        print(wynik[c(i,i+ile),])
        message('')
    }

}

#dane wej�ciowe
m�owie <- c("Henryk", "Jan", "Grzegorz", "Marek")
�ony <- c("Apolonia", "Ela", "Agatka", "Ania")

#losowanie i prezentacja wynik�w
wynik <- losujPrezentyPoprawnie(m�owie, �ony, wykres="20XX.png")
print(wynik)

message("\nW postaci do wys�ania: ")
wypisz(wynik)

