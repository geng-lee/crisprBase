% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/BaseEditor-class.R
\docType{class}
\name{baseEditorName}
\alias{baseEditorName}
\alias{baseEditorName<-}
\alias{editingWeights}
\alias{editingWeights<-}
\alias{editingStrand}
\alias{editingStrand<-}
\alias{BaseEditor-class}
\alias{BaseEditor}
\alias{show,BaseEditor-method}
\alias{baseEditorName,BaseEditor-method}
\alias{baseEditorName<-,BaseEditor-method}
\alias{editingWeights,BaseEditor-method}
\alias{editingWeights<-,BaseEditor-method}
\alias{editingStrand,BaseEditor-method}
\alias{editingStrand<-,BaseEditor-method}
\title{An S4 class to represent a base editor}
\usage{
baseEditorName(object)

baseEditorName(object) <- value

editingWeights(object, ...)

editingWeights(object) <- value

editingStrand(object)

editingStrand(object) <- value

BaseEditor(
  CrisprNuclease,
  baseEditorName = NA_character_,
  editingStrand = c("original", "opposite"),
  editingWeights = NULL
)

\S4method{show}{BaseEditor}(object)

\S4method{baseEditorName}{BaseEditor}(object)

\S4method{baseEditorName}{BaseEditor}(object) <- value

\S4method{editingWeights}{BaseEditor}(object, substitutions = NULL)

\S4method{editingWeights}{BaseEditor}(object) <- value

\S4method{editingStrand}{BaseEditor}(object)

\S4method{editingStrand}{BaseEditor}(object) <- value
}
\arguments{
\item{object}{\linkS4class{BaseEditor} object.}

\item{value}{Value to replaced with.}

\item{...}{Additional arguments for class-specific methods}

\item{CrisprNuclease}{A \linkS4class{CrisprNuclease} object.}

\item{baseEditorName}{String specifying base editor name.}

\item{editingStrand}{String indicating which strand with
respect to the target protospacer sequence will be 
edited. Must be either "original" or "opposite".
"original" by default.}

\item{editingWeights}{Numeric matrix of editing weights.
Column names must be indicating relative position to the PAM site.
Row names must be of the form "X2Y" where "X" represents the origin
base, and "Y" represents the subtituted base. For instance, "C2T"
indicates the row corresponding to C to T editing.}

\item{substitutions}{Character vector indicating which substitutions
should be returned.}
}
\value{
A BaseEditor object
}
\description{
An S4 class to represent a base editor
}
\section{Functions}{
\itemize{
\item \code{BaseEditor}: Create a \linkS4class{BaseEditor} object
}}

\section{Slots}{

\describe{
\item{\code{baseEditorName}}{Name of the base editor.}

\item{\code{editingWeights}}{Matrix of editing weights.}

\item{\code{editingStrand}}{String indicating which strand with
respect to the target protospacer sequence will be 
edited. Must be either "original" or "opposite".
"original" by default.}
}}

\section{Constructors}{

    Use the constructor \code{link{BaseEditor}} to create
    a BaseEditor object.
}

\section{Accessors}{

\describe{
    \item{\code{baseEditorName}:}{To get the name of the base editor.}
    \item{\code{editingWeights}:}{To return the matrix of editing weights.}
    \item{\code{editingStrand}:}{To return the editing strand.}
}
}

\section{Setters}{

\describe{
    \item{\code{baseEditorName<-}:}{To change the name of the base editor.}
    \item{\code{editingWeights<-}:}{To change the matrix of editing weights.}
    \item{\code{editingStrand<-}:}{To change the editing strand.}
}
}

\examples{
# Creating an object for BE4max (C to T editor)
# based on experimental weights

ws <- c(0.7, 0.7, 0.8, 1.8, 1, 2, 1.4, 1.2, 2.3, 1.3, 2.4, 2.2, 3.4, 
      2.2, 2.1, 3.5, 5.8, 16.2, 31.8, 63.2, 90.3, 100, 87, 62, 31.4, 
      16.3, 10, 5.6, 3.3, 1.9, 1.8, 2.4, 1.7, 0.5, 0.2, 0.1)
ws <- matrix(ws, nrow=1, ncol=length(ws))
rownames(ws) <- "C2T"
colnames(ws) <- -36:-1
data(SpCas9, package="crisprBase")
BE4max <- BaseEditor(SpCas9,
                     baseEditorName="BE4max",
                     editingStrand="original",
                     editingWeights=ws)
metadata(BE4max)$description_base_editor <- "BE4max cytosine base editor."

}
