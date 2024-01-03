#a  Do zmiennej a podstaw wartosc wyrazenia 4 ∗ sin(pi). Do zmiennej b podstaw potrojna˛ wartosc zmiennej a. Wywolaj funkcje˛ sprawdzajaca, ktora z wartosci zmiennych jest wieksza.
a = 4 * sin(pi)
b = 3 * a
max (a,b)

#b  Uruchom i poczytaj dokumentacje dla funkcji max()
help (max)

#c  Stworz wektor a zawierajacy liczby od 90 do 115. Policz srednia kwadratow liczb zawartych w wektorze.

wektor = (90:115)
wektor = wektor^2
average = mean (wektor)

#d Wyswietl wszystkie funkcje zawierajace fraze max w swojej nazwie.

apropos ("max", mode="function")

#e Ustaw dowolny katalog roboczy. Nastepnie stworz zmienna˛ a zawierajaca lancuch znakow “lodowka z najwieksza˛ pojemnoscia˛”.bZapisz zmienna a z obszaru roboczego do pliku w katalogu roboczym. Nastepnie usun zmienna a. Sprawdz wartosc zmiennej a (powinno jej brakowac). Na koncu wczytaj plik ze zmienna˛ a i sprawdz jej wartosc.

setwd ("C:/Users/ljsiw/Documents/ubb/apu/RBasics")
a = "lodówka z największą pojemnością"
save (a, file="a.RData")
rm (a)
a
load (file="a.Rdata")
a

#f  Zainstaluj i zaladuj pakiet gridExtra, ktory umozliwia m.in ladna wizualizacje danych tabelarycznych. Nastepnie przy pomocy dokumentacji pakietu znajdz funkcje do wizualizacji danych tabelarycznych. Uzyj jej na pierwszych 10 wierszach zbioru danych rivers.
install.packages("gridExtra")
library(gridExtra)
library(grid)
grid.table(rivers[1:10])


#g  Stworz wektor zawierajacy ciag liczb 1000, 998,996,. . . 850.
wektor = seq(1000,850, by = -2)

#h  Stworz wektora a z liczbami od 30 do 5 oraz wektor b z liczbami od 11 do 23. Utworz nowy wektory d bedacy polaczeniem wektora b i a (w takiej kolejnosci). Wyswietl go.

a = (30:5)
b = (11:23)
d = c(b,a)
print (d)

#punkt i Stwórz wektor nazwa zawierającym nazwy 10 lodówek. Potem stwórz wektory pojemnosc_uzytkowa_chlodziarki, pojemnosc_uzytkowa_zamrazarki, cena, liczba_opinii zawierające kolejno dane 10 lodówek. Następnie stwórz ramkę˛ danych lodówki złożoną˛ z wektorów pojemnosc_uzytkowa chlodziarki, pojemnosc_uzytkowa_zamrazarki, cena, liczba_opinii. Wylicz średnią cenę lodowek.

nazwa = c("Amica FK2695", "Samsung RB34T635EBN", " Haier 3-drzwiowa HTR5719ENPT", "Sharp SJ-BA05DMXWF-EU", "LG GBB92MCACP", "Beko B3RCNA344HXB", "Samsung Bespoke RB38A7B5E22", "Amica FK2515.4UTX "," Bosch KGN49XIEA","Sharp SJ-BB05DTXLF-EU")
pojemnosc_uzytkowa_chlodziarki = c(161,227,310,195,277,209,276,183,330,204 )
pojemnosc_uzytkowa_zamrazarki = c(70,114,140,75,107,92,114,84,108,84 )
cena = c(1999,2599,3999,1689,3399,2099,3680,1449,3099,1449)
liczba_opinii = c(330,124,12,57,90,11,269,179,142,14)
lodowki = data.frame(nazwa,pojemnosc_uzytkowa_chlodziarki,pojemnosc_uzytkowa_zamrazarki,cena,liczba_opinii)
mean(lodowki$cena)

#punkt j Do stworzonej w poprzednim zadaniu ramki danych lodówek dodaj wpis zawierający dane nowej lodówki. Wylicz średnią ceny ponownie.

lodowki = rbind(lodowki, data.frame(nazwa ="Liebherr GKw 1455-1", pojemnosc_uzytkowa_chlodziarki=204,pojemnosc_uzytkowa_zamrazarki=84,cena=1449,liczba_opinii=14))
print (lodowki)
mean(lodowki$cena)

#punk k - co to są srednie ceny każdej oceny?? 
#Korzystajac z ramki danych lodowki dodaj nowa˛ kolumne˛ okreslajac ocene˛klientow. Wpisz do kolumny odpowiednio oceny w skali od 0 do 5 krok 0.5. Dodana kolumna powinna się automatycznie przekonwertowac do cech jakosciowych (tzw. factors). Wylicz srednia ceny kazdej oceny.
# Nowa kolumna z ocenami klientów
oceny_klientow <- seq(0, 5, by = 0.5)
# Dodawanie nowej kolumny do ramki danych
lodowki$oceny_klientow <- factor(rep(oceny_klientow, each = nrow(lodowki) / length(oceny_klientow)))
# Obliczanie średnich cen dla każdej oceny - cokolwiek to znaczy
srednie_ceny <- tapply(lodowki$cena, lodowki$oceny_klientow, mean)
# Wyświetlenie ramki danych z nową kolumną
print(lodowki)
# Wyświetlenie średnich cen dla każdej oceny
print(srednie_ceny)


#punkt l
#Do ramki danych aparaty dodaj kolejne 4 lodowki. Narysuj na wykresie slupkowym liczebnosc reprezentantow kazdej z ocen klientow. - chyba chodzi o ramkę lodówki

lodowki = rbind(lodowki, data.frame(nazwa ="Haier 3-drzwiowa HTW5618DNPT", pojemnosc_uzytkowa_chlodziarki=235 ,pojemnosc_uzytkowa_zamrazarki=125,cena=3479,liczba_opinii=10,oceny_klientow=4.5))
lodowki = rbind(lodowki, data.frame(nazwa =" Candy COHS 38FS", pojemnosc_uzytkowa_chlodziarki=90,pojemnosc_uzytkowa_zamrazarki=0,cena=749,liczba_opinii=12,oceny_klientow=4.5))
lodowki = rbind(lodowki, data.frame(nazwa ="Beko B5RCNA366HXB1", pojemnosc_uzytkowa_chlodziarki=210,pojemnosc_uzytkowa_zamrazarki=106,cena=2449,liczba_opinii=31,oceny_klientow=4.5))
lodowki = rbind(lodowki, data.frame(nazwa =" LG GBV7180CPY", pojemnosc_uzytkowa_chlodziarki=234,pojemnosc_uzytkowa_zamrazarki=110,cena=2789,liczba_opinii=19,oceny_klientow=5.0))

#punkt m
# Instalacja i załadowanie pakietu ggplot2
# install.packages("ggplot2")
library(ggplot2)

# Tworzenie wykresu słupkowego

wykres_slupkowy <- ggplot(lodowki, aes(x = oceny_klientow)) +    geom_bar(fill = "blue") +   labs(title = "Liczba reprezentantów dla każdej oceny klientów", x = "Ocena klientów",        y = "Liczba reprezentantów")
print(wykres_slupkowy)

#punkt m Wykorzystujac ramke˛ danych lodowki pokaz procentowy udzial kazdej oceny przy pomocy wykresu kolowego oraz wachlarzowego.
# Wykres kołowy
wykres_kolowy <- ggplot(lodowki, aes(x = "", fill = oceny_klientow)) +   geom_bar(width = 1) +  coord_polar(theta = "y") +  labs(title = "Procentowy udział każdej oceny klientów") +
  scale_fill_discrete(name = "Ocena klientów") +  geom_text(stat = "count", aes(label = scales::percent(..count.. / sum(..count..))),            position = position_stack(vjust = 0.5)) +  theme_void()

print(wykres_kolowy)

# Wykres wachlarzowy
wykres_wachlarzowy <- ggplot(lodowki, aes(x = "", fill = oceny_klientow)) +   geom_bar(width = 1, position = "fill") +   labs(title = "Procentowy udział każdej oceny klientów", y = "Procenty") +   scale_y_continuous(labels = scales::percent_format(scale = 100))
print(wykres_wachlarzowy)

#punkt n
#Do ramki danych lodowki dodaj nowa kolumne status_opinii z wartosciami: “nie ma”, “mniej 50 opinii”, "50-100 opinii", "wiecej 100 opinii" w zaleznosci od liczby opinii. Zamien dodana˛ kolumne˛ na cechy jakosciowe. Nastepnie przy pomocy wykresu kolowego wyrysuj procentowy udzial lodowek o konkretnym statusie opinii.

# Tworzenie nowej kolumny "status_opinii"
lodowki$status_opinii <- cut(lodowki$liczba_opinii, breaks = c(-Inf, 0, 50, 100, Inf), labels = c("nie ma", "mniej 50 opinii", "50-100 opinii", "więcej 100 opinii"))


# Przekształcenie kolumny "status_opinii" na faktor
lodowki$status_opinii <- factor(lodowki$status_opinii, levels = c("nie ma", "mniej 50 opinii", "50-100 opinii", "więcej 100 opinii"))

# Przegląd nowej ramki danych
print(lodowki)

#punkt o Wykorzystujac ramke danych lodowki stworz zdanie o kazdej z lodowek postaci: nazwa + ” ma ocene˛ klient´ow ” + ocena_klientow+ ” bo ma liczbe˛ opinii” + liczba_opinii. Plus oznacza konkatenacje lancuchow i wartosci.
                     
for (i in 1:nrow(lodowki)) {
  zdanie <- paste(lodowki$nazwa[i], "ma ocenę klientów", lodowki$oceny_klientow[i], "bo ma liczbę opinii", lodowki$liczba_opinii[i])
  cat(zdanie, "\n")
}

#punkt p Zachowac ramk danych lodow ki w pliku .csv. Zaladowac ramke danych z pliku .csv
write.csv(lodowki, "lodowki.csv", row.names = FALSE)
lodowki_z_pliku <- read.csv("lodowki.csv")
# Wyświetl ramkę danych wczytaną z pliku
print(lodowki_z_pliku)
