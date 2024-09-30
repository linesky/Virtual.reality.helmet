
import tkinter as tk

class ScrollingTextVR:
    def __init__(self, root):
        self.root = root
        self.root.title("simulator VR: Text scroll")
        self.root.geometry("640x480")
        self.root.configure(bg="black")

        # Canvas para desenhar a simulação VR
        self.canvas = tk.Canvas(root, width=640, height=480, bg="black", highlightthickness=0)
        self.canvas.pack()

        # Dividindo a tela em duas partes com uma linha branca
        self.canvas.create_line(320, 0, 320, 480, fill="white", width=2)

        # Texto a ser rolado
        self.text = "Python"
        self.text_x = 320  # Começa fora da tela à direita
        self.text_y = 240   # Posicionado no meio da altura da tela

        # Inicia o rolar do texto
        self.scroll_text()

    def scroll_text(self):
        # Limpa o canvas
        self.canvas.delete("text")
        self.canvas.delete("text2")
        # Desenha o texto na metade esquerda
        self.canvas.create_text(self.text_x, self.text_y, text=self.text, fill="white", font=("Arial", 24), tags="text")
        

        # Desenha o texto na metade direita (deslocado 320 px para simular o outro olho)
        self.canvas.create_text(self.text_x + 320, self.text_y, text=self.text, fill="white", font=("Arial", 24), tags="text2")

        # Atualiza a posição do texto
        self.text_x -= 5  # Move o texto para a esquerda

        # Se o texto sair completamente da tela, reinicia na posição inicial
        if self.text_x + self.canvas.bbox("text")[2]<= 0:
            self.text_x = 320

        # Chama a função de novo após 50 ms para criar a animação contínua
        self.root.after(50, self.scroll_text)

if __name__ == "__main__":
    root = tk.Tk()
    app = ScrollingTextVR(root)
    root.mainloop()
