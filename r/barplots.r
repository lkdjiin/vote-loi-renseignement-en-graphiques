barplot_general <- function()
{
  png(paste0('figures/barplot_all.png'))
  barplot(m, beside=TRUE, legend.text=TRUE, col=col.vote,
          col.axis=colors[TITLE],
          col.main=colors[TITLE],
          las=1,
          fg=colors[TITLE],
          args.legend=list(x=8, y=250, box.lwd=0),
          main='Votes par groupe', font.main=3)
  dev.off()

  png(paste0('figures/barplot_all_log.png'))
  barplot(log1p(m), beside=TRUE, legend.text=TRUE, col=col.vote,
          col.axis=colors[TITLE],
          col.main=colors[TITLE],
          col.lab=colors[TITLE],
          ylab='log(votes)',
          las=1,
          fg=colors[TITLE],
          args.legend=list(x=8, y=5, box.lwd=0),
          main='Votes par groupe (logarithme)', font.main=3)
  dev.off()

  png(paste0('figures/barplot_all_percent.png'))
  barplot(prop.table(m, 2) * 100, beside=TRUE, legend.text=TRUE, col=col.vote,
          col.axis=colors[TITLE],
          col.main=colors[TITLE],
          las=1,
          fg=colors[TITLE],
          main='Votes en pourcentage par groupe', font.main=3)
  abline(h=50, col=rgb(0, 0, 0, .3))
  dev.off()
}

barplot_per_group <- function()
{
  for(group in levels(grouped$short.group)) {
    g <- grouped %>%
         filter(short.group == group) %>%
         ungroup %>%
         select(-short.group)

    png(paste0('figures/barplot_', tolower(group), '.png'))
    par(mar=c(4, 1, 4, 1))
    bp <- barplot(g$total, names.arg=g$vote, col=col.vote,
                  col.axis=colors[TITLE],
                  col.main=colors[TITLE],
                  las=1,
                  axes=FALSE,
                  fg=colors[TITLE],
                  main=group, font.main=3)
    text(bp, max(g$total) / 20, g$total, cex=2, col=rgb(0, 0, 0, .6))
    dev.off()
  }
}
