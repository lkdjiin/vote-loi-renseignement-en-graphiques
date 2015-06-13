dotplots <- function()
{
  png(paste0('figures/dot_pour.png'))
  pour <- prop.table(m, 2)[3,]
  plot(pour * 100, 1:7, xlim=c(0, 100), yaxt='n', xaxt='n',
       xlab='Pourcentage', ylab='',
       fg=colors[TITLE],
       col.axis=colors[TITLE],
       col.lab=colors[TITLE],
       col.main=colors[TITLE],
       main='Votes Pour', font.main=3, type='n')
  axis(1, at=c(0, 25, 50, 75, 100), col=colors[TITLE])
  axis(2, at=1:7, labels=levels(grouped$short.group), las=1, col=colors[TITLE])
  grid(nx=0, ny=NULL, lty=1)
  points(pour * 100, 1:7, pch=19, cex=1.8, col=colors[TITLE])
  points(pour * 100, 1:7, pch=19, cex=1.5, col=colors[POUR])
  dev.off()

  png(paste0('figures/dot_contre.png'))

  contre <- prop.table(m, 2)[2,]
  plot(contre * 100, 1:7, xlim=c(0, 100), yaxt='n', xaxt='n',
       xlab='Pourcentage', ylab='',
       fg=colors[TITLE],
       col.axis=colors[TITLE],
       col.lab=colors[TITLE],
       col.main=colors[TITLE],
       main='Votes Contre', font.main=3, type='n')
  axis(1, at=c(0, 25, 50, 75, 100), col=colors[TITLE])
  axis(2, at=1:7, labels=levels(grouped$short.group), las=1, col=colors[TITLE])
  grid(nx=0, ny=NULL, lty=1)
  points(contre * 100, 1:7, pch=19, cex=1.8, col=colors[TITLE])
  points(contre * 100, 1:7, pch=19, cex=1.5, col=colors[CONTRE])

  dev.off()

  png(paste0('figures/dot_abstention.png'))
  abstention <- prop.table(m, 2)[1,]
  plot(abstention * 100, 1:7, xlim=c(0, 100), yaxt='n', xaxt='n',
       xlab='Pourcentage', ylab='',
       fg=colors[TITLE],
       col.axis=colors[TITLE],
       col.lab=colors[TITLE],
       col.main=colors[TITLE],
       main='Abstentions', font.main=3, type='n')
  axis(1, at=c(0, 25, 50, 75, 100), col=colors[TITLE])
  axis(2, at=1:7, labels=levels(grouped$short.group), las=1, col=colors[TITLE])
  grid(nx=0, ny=NULL, lty=1)
  points(abstention * 100, 1:7, pch=19, cex=1.8, col='#AAAAAA')
  points(abstention * 100, 1:7, pch=19, cex=1.5, col=colors[ABSTENTION])
  dev.off()

  png(paste0('figures/dot_all.png'))
  plot(abstention * 100, 1:7, xlim=c(0, 100), yaxt='n', xaxt='n',
       xlab='Pourcentage', ylab='',
       fg=colors[TITLE],
       col.axis=colors[TITLE],
       col.lab=colors[TITLE],
       col.main=colors[TITLE],
       main='Votes', font.main=3, type='n')
  axis(1, at=c(0, 25, 50, 75, 100), col=colors[TITLE])
  axis(2, at=1:7, labels=levels(grouped$short.group), las=1, col=colors[TITLE])
  grid(nx=0, ny=NULL, lty=1)
  points(pour * 100, 1:7, pch=19, cex=2.6, col='white')
  points(pour * 100, 1:7, pch=19, cex=2.3, col=colors[POUR])
  points(contre * 100, 1:7, pch=19, cex=2.6, col='white')
  points(contre * 100, 1:7, pch=19, cex=2.3, col=colors[CONTRE])
  points(abstention * 100, 1:7, pch=19, cex=1.3, col='white')
  points(abstention * 100, 1:7, pch=19, cex=1.0, col=colors[ABSTENTION])
  dev.off()
}
