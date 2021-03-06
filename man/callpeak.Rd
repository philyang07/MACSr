% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/callpeak.R
\name{callpeak}
\alias{callpeak}
\title{callpeak}
\usage{
callpeak(
  tfile,
  cfile = NULL,
  gsize = "hs",
  tsize = NULL,
  format = "AUTO",
  keepduplicates = "1",
  outdir = ".",
  name = "NA",
  store_bdg = FALSE,
  do_SPMR = FALSE,
  trackline = FALSE,
  nomodel = FALSE,
  shift = 0,
  extsize = 200,
  bw = 300,
  d_min = 20,
  mfold = c(5, 50),
  onauto = FALSE,
  qvalue = 0.05,
  pvalue = NULL,
  tempdir = "/tmp",
  nolambda = FALSE,
  scaleto = "small",
  downsample = FALSE,
  slocal = 1000,
  llocal = 10000,
  broad = FALSE,
  broadcutoff = 0.1,
  maxgap = NULL,
  minlen = NULL,
  cutoff_analysis = FALSE,
  fecutoff = 0.1,
  call_summits = FALSE,
  buffer_size = 1e+05,
  verbose = 2L,
  log = TRUE,
  ...
)
}
\arguments{
\item{tfile}{ChIP-seq treatment files.}

\item{cfile}{Control files.}

\item{gsize}{Effective genome size. It can be 1.0e+9 or 1000000000,
or shortcuts:'hs' for human (2.7e9), 'mm' for mouse (1.87e9),
'ce' for C. elegans (9e7) and 'dm' for fruitfly (1.2e8),
Default:hs.}

\item{tsize}{Tag size/read length. This will override the auto
detected tag size. DEFAULT: Not set}

\item{format}{Format of tag file, "AUTO", "BED" or "ELAND" or
"ELANDMULTI" or "ELANDEXPORT" or "SAM" or "BAM" or "BOWTIE" or
"BAMPE" or "BEDPE".}

\item{keepduplicates}{It controls the behavior towards duplicate
tags at the exact same location -- the same coordination and
the same strand.}

\item{outdir}{If specified all output files will be written to that
directory.}

\item{name}{Experiment name, which will be used to generate output
file names.}

\item{store_bdg}{Whether or not to save extended fragment pileup,
and local lambda tracks (two files) at every bp into a bedGraph
file.}

\item{do_SPMR}{If True, MACS will SAVE signal per million reads for
fragment pileup profiles.}

\item{trackline}{Tells MACS to include trackline with bedGraph
files.}

\item{nomodel}{Whether or not to build the shifting model.}

\item{shift}{The arbitrary shift in bp. Use discretion while
setting it other than default value.}

\item{extsize}{The arbitrary extension size in bp.}

\item{bw}{Band width for picking regions to compute fragment size.}

\item{d_min}{Minimum fragment size in basepair. Any predicted
fragment size less than this will be excluded.}

\item{mfold}{Select the regions within MFOLD range of
high-confidence enrichment ratio against background to build
model.}

\item{onauto}{Whether turn on the auto pair model process.}

\item{qvalue}{Minimum FDR (q-value) cutoff for peak detection.}

\item{pvalue}{Pvalue cutoff for peak detection. DEFAULT: not set.}

\item{tempdir}{Optional directory to store temp files.}

\item{nolambda}{If True, MACS will use fixed background lambda as
local lambda for every peak region.}

\item{scaleto}{When set to 'small', scale the larger sample up to
the smaller sample.}

\item{downsample}{When set, random sampling method will scale down
the bigger sample. By default, MACS uses linear scaling.}

\item{slocal}{The small nearby region in basepairs to calculate
dynamic lambda.}

\item{llocal}{The large nearby region in basepairs to calculate
dynamic lambda.}

\item{broad}{If set, MACS will try to call broad peaks using the
--broad-cutoff setting.}

\item{broadcutoff}{Cutoff for broad region. This option is not
available unless --broad is set.}

\item{maxgap}{Maximum gap between significant sites to cluster them
together. The DEFAULT value is the detected read length/tag
size.}

\item{minlen}{Minimum length of a peak. The DEFAULT value is the predicted
fragment size d.}

\item{cutoff_analysis}{While set, MACS2 will analyze number or
total length of peaks that can be called by different p-value
cutoff then output a summary table to help user decide a better
cutoff.}

\item{fecutoff}{When set, the value will be used to filter out
peaks with low fold-enrichment.}

\item{call_summits}{If set, MACS will use a more sophisticated
signal processing approach to find subpeak summits in each
enriched peak region.}

\item{buffer_size}{Buffer size for incrementally increasing
internal array size to store reads alignment
information. DEFAULT: 100000.}

\item{verbose}{Set verbose level of runtime message. 0: only show
critical message, 1: show additional warning message, 2: show
process information, 3: show debug messages. DEFAULT:2}

\item{log}{Whether to capture logs.}

\item{...}{More options for macs2.}
}
\value{
\code{macsList} object.
}
\description{
Main MACS3 Function to call peaks from alignment results.
}
\examples{
eh <- ExperimentHub::ExperimentHub()
CHIP <- eh[["EH4558"]]
CTRL <- eh[["EH4563"]]
callpeak(CHIP, CTRL, gsize = 5.2e7, cutoff_analysis = TRUE,
outdir = tempdir(), name = "callpeak_narrow0")
}
