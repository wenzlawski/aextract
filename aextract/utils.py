import wandb

from aextract.config import AEParserConfig


def get_wandb_config(config: AEParserConfig):
    """
    Initialise the wandb run and return the config
    """
    wandb.init(
        # set the wandb project where this run will be logged
        project="config.project",
        # track hyperparameters and run metadata
        config={
            "learning_rate": config.lr,
            "architecture": config.architecture,
            "dataset": config.dataset,
            "epochs": config.epochs,
        },
    )


if __name__ == "__main__":
    config = AEParserConfig()
    get_wandb_config(config)
