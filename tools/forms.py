from django import forms

class WordSet(forms.From):
    PRONUNCIATION = ((0,'美式'),(1,'英式'))
    STU_DEGREE = ((0,'再认'),(1,'拼写'))
    #STU_TIMES = ((1,'一遍'),(2,'两遍'),(3,'三遍'),(4,'四遍'),(5,'五遍'))
    WS_id = forms.ForeignKey(UserAccount, on_delete = forms.CASCADE)
    WS_voc_book = forms.CharField(max_length = 20)
    WS_pronunciation = forms.IntegerField(choices = PRONUNCIATION)
    WS_translate_en = forms.BooleanField(default = True)
    WS_translate_cn = forms.BooleanField(default = True)
    WS_voc_auto_pron = forms.BooleanField(default = True)
    WS_sentence_auto_pron = forms.BoolenField(default = True)
    WS_disp_note = forms.BoolenField(default = True)
    WS_stu_degree = forms.IntegerField(choices = STU_DEGREE)
    WS_stu_times = forms.IntegerField(default = 5)
    WS_stu_volume = forms.IntegerField(default = 100)
