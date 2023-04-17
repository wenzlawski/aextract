from dataclasses import dataclass, field
from typing import Optional

import nltk
import pandas as pd
from pandarallel import pandarallel
from transformers import HfArgumentParser

# from aextract.utils import load_jsonl_pandas, remove_full_stop_after_et_al


@dataclass
class Arguments:
    """
    Arguments
    """

    fname: str = field(
        metadata={"help": "The input jsonl file path."},
    )
    output: str = field(
        metadata={"help": "The output mrp file path"},
    )
    nsent: Optional[int] = field(
        default=10,
        metadata={"help": "The number of sentences to extract from the article."},
    )
    nrows: Optional[int] = field(
        default=None,
        metadata={"help": "The number of entries to process. (0 for all)"},
    )
    mode: Optional[str] = field(
        default="split",
        metadata={"help": "The mode to run the script in."},
    )
    workers: Optional[int] = field(
        default=1,
        metadata={"help": "The number of workers to use."},
    )


def main(conf: Arguments):
    pandarallel.initialize(conf.workers)

    # Load files
    print("Loading files...")
    data = pd.read_excel(conf.fname, sheet_name=1)

    # Save the data
    print("Saving data...")
    data.to_json(conf.output, orient="records", lines=True)
    return


if __name__ == "__main__":
    nltk.download("punkt")
    parser = HfArgumentParser(Arguments)
    conf = parser.parse_args_into_dataclasses()[0]
    if conf.nrows == 0:
        conf.nrows = None

    main(conf)
