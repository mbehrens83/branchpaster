# branchpaster
Hammerspoon Lua Script, welches einen Team Foundation Server 2015 Tickettitel in einen GIT-Branch spezifischen String konvertiert. Via „Command" + „<" Shortcut kann der Titel in die Zwischenablage kopieren werden. Der Titel wird dabei in die GIT-Branch konforme Schreibweise konvertiert und kann überall wie gewohnt mit „Command“ + „V" eingefügt werden.

## Vorteile
* Kein lästiges Suchen und Ersetzen von Umlauten, Sonderzeichen etc. per Hand.
* Kein Überlegen: „Mmh, wie war jetzt die Branch-Schreibweise“.
* Kann easy angepasst und erweitert werden.

## Einrichtung
https://github.com/Hammerspoon/hammerspoon/releases/latest

Nach der Installation
> Menubar > Hammerspoon > Open Config

Inhalt des Scripts in das Textfeld einfügen. Speichern.

Fenster schließen und danach: 
> Menubar > Hammerspoon > Reload Config

Hammerspoon Berechtigungen u. a. für die Zwischenablage erteilen:
> Menubar > Hammerspoon > Preferences... > Enable Accessibility

## Verwendung
TFS Titelzeile des Tickets markieren und mit „Command“ + „<" oder „Control“ + „<„ in die Zwischenablage kopieren.
> z.B.: "Fehler 64673: Button ist aktiv auch wenn keine Daten existieren."

Version eingeben und Enter.
> z.B.: 4.0.0

Danach einfügen.
> "bug/4.0.0/64673_Button-ist-aktiv-auch-wenn-keine-Daten-existieren"
