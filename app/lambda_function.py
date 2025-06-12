def soma(x, y):
    """
    Retorna a soma de x + y
    """
    return x + y


def concat(first_word, second_word):
    """
    Concatena duas palavras e as retorna como uma string única
    """

    return first_word + "-" + second_word


def lambda_handler():

    print(soma.__doc__)

    print(concat.__doc__)

    result = soma(2, 3)

    name = concat("Rodrigo", "Amandio")

    return {"result": result, "name": name}
