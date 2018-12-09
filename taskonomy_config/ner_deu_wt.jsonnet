{
    "evaluate_on_test":true,
"dataset_reader": {
        "type": "conll2003",
        "token_indexers": {
            "token_characters": {
                "type": "characters"
            },
            "tokens": {
                "type": "single_id",
                "lowercase_tokens": true
            }
        }
    },
    "iterator": {
        "type": "basic",
        "batch_size": 32
    },
    "model": {
        "type": "crf_tagger",
        "calculate_span_f1": true,
        "constrain_crf_decoding": true,
        "dropout": 0.5,
        "encoder": {
            "type": "lstm",
            "bidirectional": true,
            "dropout": 0.5,
            "hidden_size": 200,
            "input_size": 628,
            "num_layers": 1
        },
        "include_start_end_transitions": false,
        "label_encoding": "IOB1",
        "text_field_embedder": {
            "type": "weighted_average",
            "output_dim": 200,
            "token_embedders": {
                "eng_embedder": {
                    "type": "ner_embedder",
                    "cuda_device": 0,
                    "serialization_dir": "pretrained/ner_eng/"
                },
                "esp_embedder": {
                    "type": "ner_embedder",
                    "cuda_device": 0,
                    "serialization_dir": "pretrained/ner_esp/"
                },
                "ned_embedder": {
                    "type": "ner_embedder",
                    "cuda_device": 0,
                    "serialization_dir": "pretrained/ner_ned/"
                },
                "token_characters": {
                    "type": "character_encoding",
                    "embedding": {
                        "embedding_dim": 16
                    },
                    "encoder": {
                        "type": "cnn",
                        "conv_layer_activation": "relu",
                        "embedding_dim": 16,
                        "ngram_filter_sizes": [
                            3
                        ],
                        "num_filters": 128
                    }
                },
                "tokens": {
                    "type": "embedding",
                    "embedding_dim": 300,
                    "pretrained_file": "datasets/fasttext/wiki.multi.vec",
                    "trainable": false
                }
            }
        }
    },
    "train_data_path": "datasets/ner_xling/deu.train",
    "validation_data_path": "datasets/ner_xling/deu.testa",
    "test_data_path": "datasets/ner_xling/deu.testb",
    "trainer": {
        "cuda_device": 0,
        "grad_norm": 5,
        "num_epochs": 25,
        "num_serialized_models_to_keep": 3,
        "optimizer": {
            "type": "adam",
            "lr": 0.001
        },
        "patience": 25,
        "validation_metric": "+f1-measure-overall"
    },
    "validation_dataset_reader": {
        "type": "conll2003",
        "coding_scheme": "IOB1",
        "token_indexers": {
            "token_characters": {
                "type": "characters"
            },
            "tokens": {
                "type": "single_id",
                "lowercase_tokens": true
            }
        }
    },
    "validation_iterator": {
        "type": "basic",
        "batch_size": 64
    }
}
