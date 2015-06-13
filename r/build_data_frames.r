# Builds `df`, `grouped` and `grouped2`.
build_data_frames <- function()
{
  d <- fromJSON('data/vote-loi-renseignement.json')
  local_df <- data.frame(person=character(0), group=character(0), vote=character(0))

  for(group in names(d)) {
    for(vote in names(d[group][[1]])) {
      for(person in d[group][[1]][vote][[1]]) {
        if(is.character(person)) {
          local_df <- rbind(local_df, data.frame(person=person, group=group, vote=vote))
        }
      }
    }
  }

  local_df$person <- as.character(local_df$person)
  local_df$short.group <- ''
  local_df$short.group[grepl('^Non', local_df$group)] <- 'NI'
  local_df$short.group[grepl('populaire', local_df$group)] <- 'UMP'
  local_df$short.group[grepl('progressiste', local_df$group)] <- 'RRDP'
  local_df$short.group[grepl('écologiste', local_df$group)] <- 'Écolo'
  local_df$short.group[grepl('indépendants', local_df$group)] <- 'UDI'
  local_df$short.group[grepl('socialiste', local_df$group)] <- 'SRC'
  local_df$short.group[grepl('gauche', local_df$group)] <- 'GDR'
  local_df$short.group <- as.factor(local_df$short.group)

  local_df <- tbl_df(local_df)

  local_grouped <- summarize(group_by(local_df, short.group, vote), total=n())

  rest <- data.frame(short.group=c('GDR', 'RRDP', 'RRDP'),
                     vote=c('Abstention', 'Abstention', 'Contre'),
                     total=0)
  local_grouped2 <- rbind(local_grouped, rest)
  local_grouped2 <- ungroup(local_grouped2)
  local_grouped2 <- arrange(local_grouped2, short.group, vote)

  assign("df", local_df, envir=.GlobalEnv)
  assign("grouped", local_grouped, envir=.GlobalEnv)
  assign("grouped2", local_grouped2, envir=.GlobalEnv)
}
