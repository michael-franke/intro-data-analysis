theme_ida <- function(title.size = 16, text.size = 14, legend.position = "top", 
                      show.axis = FALSE, show.grid = TRUE,
                      plot.margin = c(.2, .1, .2, .1)){
  # baseline
  layout <- theme_classic()
  layout <- layout + theme(text = element_text(size = text.size),
                           title = element_text(size = title.size, 
                                                face = "bold"),
                           line = element_line(size = .5))
  
  # axis
  if (inherits(show.axis, "character") | show.axis == FALSE){
    if (inherits(show.axis, "character")){
      show.axis <- tolower(show.axis)
      if (show.axis == "x"){
        layout <- layout + theme(axis.line.y = element_blank())
      }
      if (show.axis == "y"){
        layout <- layout + theme(axis.line.x = element_blank())
      }
    } else {
      layout <- layout + theme(axis.line.x = element_blank(),
                               axis.line.y = element_blank())
    }
  }
  
  # grid lines
  if (show.grid == TRUE){
    layout <- layout + theme(panel.grid.major = element_line(size = .2, 
                                                             color = "#333333", 
                                                             linetype = "dotted"))
  }
  
  # axis titles
  layout <- layout + theme(axis.title.x = element_text(margin = margin(t = 8)))
  
  # axis labels
  layout <- layout + theme(axis.text = element_text(face = "plain"))
  
  # subtitle
  layout <- layout + theme(plot.subtitle = element_text(face = "plain", 
                                                        color = "#4d4d4d"))
  
  # legend
  layout <- layout + theme(legend.position = legend.position,
                           legend.background = element_blank(),
                           legend.key.height = unit(2, "line"))
  
  # facets 
  layout <- layout + theme(strip.background = element_blank(),
                           strip.text = element_text(size = title.size,
                                                     face = "bold"))
  
  # misc 
  layout <- layout + theme(panel.background = element_rect(fill = "white"),
                           plot.background = element_rect(fill = "white"),
                           plot.margin = unit(plot.margin, "cm"))
  
  layout
}
