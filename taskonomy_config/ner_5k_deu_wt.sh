NER_TRAIN_DATA_PATH=datasets/ner_xling/deu_5k.pkl NER_TEST_A_DATA_PATH=datasets/ner_xling/deu.testa NER_TEST_B_DATA_PATH=datasets/ner_xling/deu.testb  allennlp train -s saved_models/ner_5k_deu_wt taskonomy_config/ner_5k_deu_wt.jsonnet
