import requests

def ask_deepseek(prompt):
    print(f"Prompting DeepSeek with:\n{prompt}\n")
    response = requests.post(
        "http://host.docker.internal:11434/api/generate",
        json={
            "model": "deepseek-coder:6.7b",
            "prompt": prompt,
            "stream": False
        }
    )
    output = response.json()["response"]
    print("\n🤖 DeepSeek says:\n", output)
    return output

# Testprompt
code = ask_deepseek("Write a Python function that returns the square of a number.")