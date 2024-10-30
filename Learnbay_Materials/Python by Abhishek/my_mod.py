import re
def email_verification(email):
    if '@' in email and '.' in email:
        print('Correct email address')
    else:
        print('Incorrect Email Address')

        

def password_validation(pwd):
    if re.findall(r'[A-Z]', pwd) and re.findall(r'[a-z]', pwd) and re.findall(r'[0-9]', pwd) and len(pwd) > 6 and 
    re.findall(r'[@#!$%^&*(){}[]]', pwd):
        print('Valid Password')
    else:
        print('Invalid Password')

if __name__ == '__main__':
    email_verification('abc@gmail.com')
    password_validation('Python#123')
    password_validation('Python#')
