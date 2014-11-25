##XmassDraw
Jest to programik, który losuje, kto komu będzie kupował prezent pod choinkę. Aby wszystko było poprawne, muszą być spełnione następujące warunki:
  - nie kupujemy prezentów sobie.
  - nie kupujemy prezentu mężowi/żonie *)

*) To znaczy kupujemy męzowi/żonie ale zupełnie niezależnie od tego losowania.

###Zadanie
Przypisać każdej osobie inna osobę, tak by nie był to jej małżonek lub małżonka.

###Rozwiązanie
Układamy osoby w ciąg, tak aby najpierw byli wylistowani mężowie, a następnie w tej samej kolejności żony.
Permutujemy ciąg do momentu, aż nie zostaną spełnione warunki poprawności rozwiązania.

Przykładowy wynik losowania:

```
> source("xdraw.R")
       kto     komu
1   Henryk      Ela
2      Jan Grzegorz
3 Grzegorz Apolonia
4    Marek      Jan
5 Apolonia   Agatka
6      Ela     Ania
7   Agatka    Marek
8     Ania   Henryk
```

To samo w formie wykresu:

![wynik 20XX](https://github.com/gregsab/XmassDraw/blob/master/20XX.png)
