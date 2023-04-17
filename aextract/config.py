import datetime
from dataclasses import dataclass, field
from typing import Optional


@dataclass
class AEParserConfig:
    """
    Arguments for model training
    """

    log: Optional[str] = field(
        default=f'./log/{datetime.datetime.now().strftime("%Y-%m-%d_%H-%M-%S")}',
        metadata={"help": "The directory path for logging"},
    )
    ftrain: Optional[str] = field(
        default=None,
        metadata={"help": "Train file (.mrp)"},
    )
    fvalid: Optional[str] = field(
        default=None,
        metadata={"help": "Validation file (.mrp)"},
    )
    ftest: Optional[str] = field(
        default=None,
        metadata={"help": "Test file (.mrp)"},
    )
    dataset: Optional[str] = field(
        default="aaec",
        metadata={"help": "The dataset name"},
    )
    architecture: Optional[str] = field(
        default="longformer",
        metadata={"help": "The architecture name"},
    )
    seed: Optional[int] = field(
        default=42,
        metadata={"help": "The random seed for model and training initialization"},
    )
    do_lower_case: Optional[bool] = field(
        default=False,
        metadata={"help": "Makes input tokens lower cased"},
    )
    attention_window: Optional[int] = field(
        default=512,
        metadata={"help": "The attention window-size for Longformer"},
    )
    max_encode: Optional[int] = field(
        default=4096,
        metadata={"help": "The max token length for the encoder"},
    )

    embed_dropout: Optional[float] = field(
        default=0.1,
        metadata={"help": "The dropout ratio of the input embeddings"},
    )
    model_name_or_path: Optional[str] = field(
        default="roberta-base",
        metadata={
            "help": "The model path or name."
            " If there exists a corresponding local path, the local model will be loaded."
            " Otherwise, the pre-trained model from Huggingface will be used."
        },
    )
    postprocessor: Optional[str] = field(
        default="default:default,aaec:aaec,aaec_essay:aaec,aaec_para:aaec,mtc:mtc,cdcp:cdcp,abstrct:abstrct,aasd:aasd,tree:tree,trees:trees,graph:graph,ssa:ssa",
        metadata={"help": "The postprocessor key and value for each framework."},
    )

    lr: Optional[float] = field(
        default=5e-5,
        metadata={"help": "The learning rate"},
    )
    batch_size: Optional[int] = field(
        default=4,
        metadata={"help": "The batch size for training"},
    )
    eval_batch_size: Optional[int] = field(
        default=4,
        metadata={"help": "The batch size for prediction and evaluation"},
    )
    epochs: Optional[int] = field(
        default=20,
        metadata={"help": "The number of epochs"},
    )
    terminate_epochs: Optional[int] = field(
        default=20,
        metadata={
            "help": "The number of terminate epochs. "
            "Training will be forced to terminate by this epoch number."
        },
    )
    evaluate_epochs: Optional[int] = field(
        default=2,
        metadata={
            "help": "The number of epochs for evaluation. "
            "Validation will be conducted every this epochs."
        },
    )

    disable_evaluation: Optional[bool] = field(
        default=False,
        metadata={
            "help": "Whether to disable evaluations."
            " If true, validation and test files will be ignored."
        },
    )
    disable_saving_large_files: Optional[bool] = field(
        default=False,
        metadata={
            "help": "Whether to disable saving large files."
            " If true, the model and training progress will not be saved."
        },
    )
