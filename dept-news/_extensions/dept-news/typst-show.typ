#show: newsletter.with(
$if(title)$
  title: [$title$],
$endif$
$if(edition)$
  edition: [$edition$],
$endif$
$if(hero-image)$
  hero-image: (
    image: image("$hero-image.path$"),
    caption: [$hero-image.caption$]
  ),
$endif$
$if(dedication)$
  dedication: [$dedication$],
$endif$
$if(publication-info)$
  publication-info: [$publication-info$],
$endif$
)

