`print.betadisper` <- function(x, digits = max(3, getOption("digits") - 3),
                               max.lambda = 8, ...)
{
    ## limit number of eignvals to 8
    ax.lim <- min(length(x$eig), max.lambda)
    ##
    cat("\n")
    writeLines(strwrap("Homogeneity of multivariate dispersions\n",
                       prefix = "\t"))
    cat("\n")
    writeLines(strwrap(pasteCall(x$call)))
    cat(paste("\nNo. of Positive Eigenvalues:", sum(x$eig > 0)))
    cat(paste("\nNo. of Negative Eigenvalues:", sum(x$eig < 0)))
    cat("\n\n")
    type <- ifelse(isTRUE(all.equal(attr(x, "type"), "median")),
                   "median", "centroid")
    writeLines(strwrap(paste0("Average distance to ", type, ":\n")))
    print.default(tapply(x$distances, x$group, mean), digits = digits)
    cat("\n")
    writeLines(strwrap("Eigenvalues for PCoA axes:\n"))
    print.default(round(x$eig[seq_len(ax.lim)], digits = digits))
    invisible(x)
}
