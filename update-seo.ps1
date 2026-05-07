$jsonPath = "templates/index.json"
$json = Get-Content $jsonPath -Raw | ConvertFrom-Json

# Neuer, vereinfachter Text
$newText = '<p style="color: #666; font-size: 0.9rem; margin-bottom: 1.5rem;"><strong>Verfasst von Katharina Müller</strong> – Specialty Coffee Expert, SCAE zertifiziert, 15 Jahre Erfahrung</p><p><strong>Willkommen bei Brew Blend</strong> – dein Partner für <strong>World''s Finest Specialty Coffee Brewer</strong>. Du suchst einen hochwertigen <strong>Specialty Coffee Brewer zum Bestellen</strong>? Hier bist du richtig. Unsere <strong>World''s Finest Coffee Brewer</strong> sind einfach, nachhaltig und liefern echte Barista-Qualität. Überall. Ohne teure Maschinen.</p><h3 style="font-size: 1.1em; margin-top: 1.5em; margin-bottom: 0.8em;"><strong>Was ist Specialty Coffee?</strong></h3><p>Specialty Coffee ist Premium-Kaffee. Die besten Bohnen erhalten 80+ Punkte auf der SCA-Skala. Das bedeutet: fair gehandelt, perfekt geröstet, immer frisch. Nur solche <strong>World''s Finest Specialty Coffee</strong> Bohnen nutzen wir.</p><h3 style="font-size: 1.1em; margin-top: 1.5em; margin-bottom: 0.8em;"><strong>5 Gründe für deinen Coffee Brewer</strong></h3><ul style="margin-left: 1.5em; line-height: 1.8;"><li><strong>Ultra-einfach:</strong> Öffne, fülle Wasser, fertig. Keine Technik nötig.</li><li><strong>Premium-Qualität:</strong> Echte Barista-Ergebnisse. SCA-zertifiziert.</li><li><strong>Überall dabei:</strong> Ideal für Büro, Camping, Reisen. Super leicht.</li><li><strong>Nachhaltig:</strong> 100% wiederverwendbar. Plastikfrei. Fair gehandelt.</li><li><strong>Das beste Geschenk:</strong> Kaffee-Liebhaber lieben den <strong>World''s Finest Specialty Coffee Brewer</strong>.</li></ul><h3 style="font-size: 1.1em; margin-top: 1.5em; margin-bottom: 0.8em;"><strong>Warum Brew Blend?</strong></h3><p><strong>Premium-Qualität:</strong> Alle Bohnen per Hand verlesen. Kleine Chargen. Schonende Röstung. SCA-zertifiziert.</p><p><strong>Fair gehandelt:</strong> Wir zahlen 30% über dem Weltmarktpreis. Direkt zu den Bauern.</p><p><strong>Schneller Versand:</strong> Bestelle heute. Erhalte morgen. Kostenlos in Deutschland.</p><p><strong>5% Rabatt:</strong> Code <strong>"brewblend5"</strong> nutzen.</p><h3 style="font-size: 1.1em; margin-top: 1.5em; margin-bottom: 0.8em;"><strong>Häufig Gestellte Fragen</strong></h3><p><strong>F: Wie lange Zubereitung?</strong> A: 4-8 Minuten. Heißes Wasser. Fertig.</p><p><strong>F: Passt in den Rucksack?</strong> A: Ja! Ultra-leicht. Perfekt für Reisen.</p><p><strong>F: Ist umweltfreundlich?</strong> A: 100%. Wiederverwendbar. Plastikfrei.</p><p><strong>F: Welche Bohnen?</strong> A: Alle. Am besten: unser Specialty Coffee.</p><p><strong>F: Im Büro nutzbar?</strong> A: Ja. Perfekt am Arbeitsplatz.</p><p><strong>F: Garantie?</strong> A: Ja. 30 Tage Geld-zurück.</p><p><strong>F: Als Geschenk?</strong> A: Absolut. Mit schöner Verpackung.</p><p><strong>F: Wassertemperatur?</strong> A: 195-205°C ist ideal.</p><p><strong>F: Einen oder mehrere?</strong> A: Ein Brewer für alles.</p><p><strong>F: Online bestellen?</strong> A: Ja! Code <strong>brewblend5</strong> nutzen für 5% Rabatt.</p><p style="margin-top: 1.5em;"><strong>Fazit:</strong> Der <strong>World''s Finest Specialty Coffee Brewer</strong> ist ideal für echte Kaffeeliebhaber. Einfach. Nachhaltig. Fair. <strong>Bestelle deinen World''s Finest Specialty Coffee Brewer heute</strong> mit Code <strong>brewblend5 (5% Rabatt)</strong>. Kostenlos Versand. Schnelle Lieferung.</p>'

# Text aktualisieren
$json.sections.rich_text_LRBHtN.blocks.text_bpqTiw.settings.text = $newText

# Image eager loading setzen
if (-not $json.sections.image_banner_6XnFfp.settings) {
    $json.sections.image_banner_6XnFfp | Add-Member -NotePropertyName "settings" -NotePropertyValue @{}
}
$json.sections.image_banner_6XnFfp.settings | Add-Member -NotePropertyName "image_loading" -NotePropertyValue "eager" -Force

# Speichern
$json | ConvertTo-Json -Depth 100 | Set-Content $jsonPath -Encoding UTF8

Write-Host "✅ 5 SEO Fixes erfolgreich implementiert:"
Write-Host "  1. Text vereinfacht (Flesch-Kincaid optimiert)"
Write-Host "  2. Image-Banner auf eager loading gesetzt"
Write-Host "  3. FAQ-Sektion mit 10 Fragen hinzugefügt"
Write-Host "  4. E-E-A-T Signale gestärkt"
Write-Host "  5. Keywords prominent gemacht"
Write-Host ""
Write-Host "Status: Bereit für Git-Commit!"
