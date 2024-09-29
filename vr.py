
import tkinter as tk

class VRWindow:
    def __init__(self, root):
        self.root = root
        self.root.title("Ssimulator VR use <Left> <Right> keys ")
        self.root.geometry("640x480")
        self.root.configure(bg="black")

        # Canvas para desenhar a simulação VR
        self.canvas = tk.Canvas(root, width=640, height=480, bg="black", highlightthickness=0)
        self.canvas.pack()

        # Dividindo a tela em duas partes com uma linha branca
        self.canvas.create_line(320, 0, 320, 480, fill="white", width=2)

        # Variáveis de controle para a posição do X e do quadrado
        self.x_left = 150
        self.x_right = 180  # 30 px diferença para simular os 30 graus
        self.y_left = 240
        self.y_right = 240

        # Desenho inicial
        self.draw_scene()

        # Bind das teclas de movimento
        self.root.bind("<Left>", self.move_left)
        self.root.bind("<Right>", self.move_right)

    def draw_scene(self):
        self.canvas.delete("all")

        # Linha branca no meio
        self.canvas.create_line(320, 0, 320, 480, fill="white", width=2)

        # Desenha o "X" na objetiva esquerda
        self.draw_x(self.x_left, self.y_left)

        # Desenha o "X" na objetiva direita com o quadrado
        #self.draw_x(self.x_right, self.y_right)
        self.canvas.create_rectangle(320+self.x_right - 30, self.y_right - 30, 
                                     320+self.x_right + 30, self.y_right + 30, 
                                     outline="white")
        self.canvas.create_rectangle(self.x_right - 30, self.y_right - 30, 
                                     self.x_right + 30, self.y_right + 30, 
                                     outline="white")


    def draw_x(self, x, y):
        # Desenha um "X" no local fornecido
        self.canvas.create_line(0, 0,self.x_right - 30, self.y_right - 30, fill="white", width=2)
        self.canvas.create_line(320+0, 0,320+self.x_right - 30, self.y_right - 30, fill="white", width=2)
        self.canvas.create_line(640, 0,320 + self.x_right  + 30, self.y_right - 30, fill="white", width=2)
        self.canvas.create_line(320, 0,0 + self.x_right  + 30, self.y_right - 30, fill="white", width=2)
        self.canvas.create_line(320, 480,320 + self.x_right  - 30, self.y_right + 30, fill="white", width=2)
        self.canvas.create_line(0, 480,0 + self.x_right  - 30, self.y_right + 30, fill="white", width=2)
        self.canvas.create_line(640, 480,320 + self.x_right  + 30, self.y_right + 30, fill="white", width=2)
        self.canvas.create_line(320, 480,0 + self.x_right  + 30, self.y_right + 30, fill="white", width=2)
    def move_left(self, event):
        # Move o X e o quadrado mais à esquerda
        self.x_left -= 10
        self.x_right -= 10
        self.draw_scene()

    def move_right(self, event):
        # Move o X e o quadrado mais à direita
        self.x_left += 10
        self.x_right += 10
        self.draw_scene()

if __name__ == "__main__":
    root = tk.Tk()
    app = VRWindow(root)
    root.mainloop()
