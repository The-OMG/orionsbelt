﻿{collection.replaceFirst(/^(?i)(The)\s(.+)/, /$2, $1/).replaceFirst(/^(?i)(Collection of the)\s(.+)/, /$2 Collection/).replaceAll(/Saga Collection/, "Saga").replaceAll(/[`´‘’ʻ""“”]/, "'").replaceAll(/[:|]/, " - ").replaceAll(/[?]/, "!").replaceAll(/[*\s]+/, " ")}
\
{norm = {it.upperInitial().lowerTrail().replaceTrailingBrackets().replaceAll(/[`´‘’ʻ""“”]/, "'").replaceAll(/[:|]/, " - ").replaceAll(/[?]/, "!").replaceAll(/[*\s]+/, " ").replaceAll(/\b[IiVvXx]+\b/, { it.upper() }).replaceAll(/\b[0-9](?i:th|nd|rd)\b/, { it.lower() }).replaceFirst(/^(?i)(The)\s(.+)/, /$2, $1/)}; norm(n)}{if (norm(n) != norm(primaryTitle)) ' ('+norm(primaryTitle)+')'}
{fn.contains('3D') || fn.contains('3-D') ? ' '+'3D':""}
({y} 
{certification})
/
{norm(n)}
{fn.contains('3D') || fn.contains('3-D') ? ' '+'3D':""}
{' (' + fn.matchAll(/extended|uncensored|remastered|unrated|uncut|directors.cut|special.edition/)*.upperInitial()*.lowerTrail().sort().join(', ').replaceAll(/[._]/, " ") + ')'}
{" Part $pi"}
{" [$vf $vc $ac $af $group]"}