import json
import pandas as pd

with open('data/schacon.repos.json', 'r') as file:
    data = json.load(file)

repo_list = []
for repo in data[:5]: 
    repo_list.append([
        repo.get("name", ""),
        repo.get("html_url", ""),
        repo.get("updated_at", ""),
        repo.get("visibility", "")
    ])


df = pd.DataFrame(repo_list, columns=["name", "html_url", "updated_at", "visibility"])


df.to_csv("chacon.csv", index=False, header=False)
