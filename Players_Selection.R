# Players Selection:

# To View the Table Content and Values:
  View(plyr_bat_2017)
  View(plyr_bowl_2017)
  View(plyr_bat_against_opp)
  View(plyr_bowl_against_opp)

# Draw Bar Graph for this:

# 1) Sort the Ind Player Batting in descending order based on Average >= 50, SR >= 100 and Number of Match atleast >= 5

  # Table:
  top_batsman_2017 <- plyr_bat_2017 %>% filter(Inns >= 5, SR >= 100, Ave >= 50) %>% arrange(desc(Ave))
  
  # Graph:
  ggplot(data=plyr_bat_2017) + geom_bar(mapping = aes(x=Player, y=Ave, fill = ((Ave >= 50) & (SR >= 100) & (Inns >= 5))), stat = "identity") + scale_fill_manual("Batting Avg in 2017 Year", values = c("orange", "lightblue"), labels = c("Bad Avg, SR/ Matches < 5", "Good Avg, SR")) + coord_flip() + geom_hline(aes(yintercept = 50, linetype = "50 Average"), colour = "red")


# 2) Sort the Ind Player Bowling in Ascending order based on Average < 30 and Economy < 6 and Number of Match atleast >= 5
  
  # Table:
  top_bowlers_2017 <- plyr_bowl_2017 %>% filter(Inns >= 5, Ave < 30, ECON < 6) %>% arrange(Ave)
  
  # Graph:
  ggplot(data=plyr_bowl_2017)+geom_bar(mapping = aes(x=Player, y=Ave, fill = ((Ave < 30) & (Inns >= 5) & (ECON < 6))), stat = "identity") + scale_fill_manual("Bowl Avg & Econ in 2017 Year", values = c("orange", "lightblue"), labels = c("Bad Avg, Econ/ Matches < 5", "Good Avg, Econ")) + coord_flip() + geom_hline(aes(yintercept = 30, linetype = "30 Average"), colour = "blue")


# 3) Sort the Player Batting against Opp Team in descending order based on Average >= 50, SR >= 100 and Minimum 2 Innings played

  # Table:
  top_batsman_agst_opp <- plyr_bat_against_opp %>% filter(Inns >= 2, Ave >= 50) %>% arrange(desc(Ave))

  # Graph:
  ggplot(data= plyr_bat_against_opp) + geom_bar(mapping = aes(x=Player, y=Ave, fill = (Ave >= 50) & (SR >= 100) & (Inns >= 2)), stat = "identity") + scale_fill_manual("Batting Avg against Opp Team", values = c("orange", "lightblue"), labels = c("Bad Avg, SR/ Matches < 2","Good Avg, SR")) + coord_flip() + geom_hline(aes(yintercept = 50, linetype = "50 Average"), colour = "red")


# 4) Sort the Ind Player Bowling in Ascending order based on Average < 30 and Economy < 6 and Number of Match atleast >= 2

  # Table:
  top_bowlers_agst_opp <- plyr_bowl_against_opp %>% filter(Inns >= 2, Ave < 30, ECON < 6) %>% arrange(Ave)

  # Graph:
  ggplot(data=plyr_bowl_against_opp)+geom_bar(mapping = aes(x=Player, y=Ave, fill = ((Ave<30) & (ECON < 6) & (Inns >=2))), stat = "identity") + scale_fill_manual("Bowl Avg,Econ against Opp Team", values = c("orange", "lightblue"), labels = c("Bad Avg, Econ/ Matches < 2", "Good Avg, Econ")) + coord_flip() + geom_hline(aes(yintercept = 30, linetype = "30 Average"), colour = "blue")

# 5) Before combine the players list add one Category column in all the four tables.

    top_batsman_2017$Category <- "2017"
    top_bowlers_2017$Category <- "2017"
    top_batsman_agst_opp$Category <- "OppTeam"
    top_bowlers_agst_opp$Category <- "OppTeam"

# 6) Combine Top Batsman from 2017 list and Played against Opp Team and draw bar chart : Top 10 Batsman Stats

  # Table:
  Batsman_Stats <- rbind(top_batsman_2017, top_batsman_agst_opp)
  
  # Graph:
  ggplot(Batsman_Stats, aes(x=Player, y=Ave, fill=Category)) + geom_bar(stat="identity", position = "dodge") + ggtitle("Batsman Stats", subtitle = "Listed Top Batsman based on Average and Economy in 2017 & Against Opponent Team ")

# 7) Combine Top Bowlers from 2017 list and Played against Opp Team and draw bar chart : Top 10 Bowler Stats

  # Table:
  Bowler_Stats <- rbind(top_bowlers_2017, top_bowlers_agst_opp)

  # Graph:
  ggplot(Bowler_Stats, aes(x=Player, y=Ave, fill=Category)) + geom_bar(stat="identity", position = "dodge") + ggtitle("Bowler Stats", subtitle = "Listed Top Bowlers based on Average and Economy in 2017 & Against Opponent Team ")
