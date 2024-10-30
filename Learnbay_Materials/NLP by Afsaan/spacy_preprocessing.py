import spacy

spacy.downlaod('model')

class Preprocessing:
    
    def __init__(self): # constructor
        self.nlp = spacy.load('en_core_web_sm')
    
    def precprocessing(self, text):
        doc = self.nlp(text)
        clean_data = []
        for token in doc:
            if not token.is_stop:
                if not token.is_punct:
                    clean_data.append(token.text)
        
        
        return " ".join(clean_data).strip()