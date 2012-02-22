from opinions.models import Question

def cfaair(request):
    params = {}
    params['host'] = 'http://' + request.get_host()

    has_voted = False
    question = None
    try:
        question = Question.objects.filter(is_active=True).all()[0:1].get()
        voted_question = request.COOKIES.get('VOTED', '')
        if voted_question:
            if int(question.id) == int(voted_question):
                has_voted = True
                params['options'] = [
                    float(question.option_1_vote) / question.total_vote * 100,
                    float(question.option_2_vote) / question.total_vote * 100,
                    float(question.option_3_vote) / question.total_vote * 100
                ]
    except Exception, e:
        question = None

    params['question'] = question
    params['has_voted'] = has_voted
    return params