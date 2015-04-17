library(dplyr)

ggdat2 <- data_frame(
        x3 = rep(letters[1:4], 8),
        y3 = rep(1:8, each = 4),
        z = factor(rep(c("x", "y", "a", "b"), each = 8), levels = c(c("x", "y", "a", "b")))
    ) %>%
    mutate(
        w = as.character(c(rep(1, 28), rep(0, 4))),
        txt = c(rep("", 28), "x", "y", "a", "b")
    )

ggplot(data = ggdat2, aes(x = x3, y = y3, fill=w)) + 
        geom_tile(data = ggdat2, aes(x = x3, y = y3, fill=w), size = 1, color="white") +
        theme_bw() +
        theme(
            axis.text = element_blank(),
            axis.ticks = element_blank(),
            panel.grid.major =element_blank(),
            panel.grid.minor = element_blank(),
            strip.text = element_text(color = "white", family = "Times", size=20),
            plot.margin=unit(c(-7, 0, -14, -6),"pt"),
            panel.border = element_rect(color=NA), 
            axis.title.x = element_text(family = "Times", size=18, vjust = 2),
            strip.background = element_rect(color=NA, fill="grey60"),
            panel.margin = unit(.1, "lines")
    ) +
    ylab(NULL) +
    xlab(NULL)  +
    #coord_cartesian(c(0, 5.5), c(0, 9)) +
    geom_text(data = ggdat2, aes(x = x3, y = y3+.06, label = txt), size = 8, color="white", family="Times") +
    scale_fill_manual(values=c("grey50", "grey80")) +
    guides(fill=FALSE) +
    

#  ggsave("data.png", width=2.5, height=3)


