results <- function()
{
  s <- rowSums(m)

  png(paste0('figures/results.png'))

  par(mar=c(4, 1, 4, 2))
  bp <- barplot(s, col=col.vote, ylim=c(0, 500), axes=FALSE,
                col.main=colors[TITLE],
                col.axis=colors[TITLE],
                fg=colors[TITLE],
                main='Résultat des votes', font.main=3)
  text(bp, s + 20, s, cex=1.5, col=colors[TITLE])

  dev.off()
}
