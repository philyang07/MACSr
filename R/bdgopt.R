#' bdgopt
#'
#' Operations on score column of bedGraph file. Note: All regions on
#' the same chromosome in the bedGraph file should be continuous so
#' only bedGraph files from MACS3 are accpetable.
#'
#' @param ifile MACS score in bedGraph. Note: this must be a bedGraph
#'     file covering the ENTIRE genome. REQUIRED
#' @param method Method to modify the score column of bedGraph
#'     file. Available choices are: multiply, add, max, min, or
#'     p2q. 1) multiply, the EXTRAPARAM is required and will be
#'     multiplied to the score column. If you intend to divide the
#'     score column by X, use value of 1/X as EXTRAPARAM. 2) add, the
#'     EXTRAPARAM is required and will be added to the score
#'     column. If you intend to subtract the score column by X, use
#'     value of -X as EXTRAPARAM. 3) max, the EXTRAPARAM is required
#'     and will take the maximum value between score and the
#'     EXTRAPARAM. 4) min, the EXTRAPARAM is required and will take
#'     the minimum value between score and the EXTRAPARAM. 5) p2q,
#'     this will convert p-value scores to q-value scores using
#'     Benjamini-Hochberg process. The EXTRAPARAM is not
#'     required. This method assumes the scores are -log10 p-value
#'     from MACS3. Any other types of score will cause unexpected
#'     errors.", default="p2q"
#' 
#' @param extraparam The extra parameter for METHOD. Check the detail
#'     of -m option.
#' @param outputfile Output filename. Mutually exclusive with
#'     --o-prefix. The number and the order of arguments for --ofile
#'     must be the same as for -m.
#' @param outdir The output directory.
#' @param log Whether to capture logs.
#' @examples
#' \dontrun{
#' bdgopt("run_callpeak_narrow0_treat_pileup.bdg",
#' method = "min", extraparam = 10, outdir = "/tmp", outputfile = "bdgopt_min.bdg")
#' }
bdgopt <- function(ifile,
                   method = c("multiply", "add", "p2q", "max", "min"),
                   extraparam = numeric(),
                   outputfile = character(),
                   outdir = ".", log = TRUE){
    method <- match.arg(method)
    opts <- .namespace()$Namespace(ifile = ifile,
                                   method = method,
                                   extraparam = list(extraparam),
                                   ofile = outputfile,
                                   outdir = outdir)
    if(log){
        .logging()$run()
        res <- py_capture_output(.bdgopt()$run(opts))
        message(res)
    }else{
        res <- .bdgopt()$run(opts)
    }

    ofile <- file.path(outdir, outputfile)
    args <- as.list(match.call())
    macsList(fun = args[[1]], arguments = args[-1], outputs = ofile, log = res)
}
