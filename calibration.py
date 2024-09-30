
import tkinter as tk

class EyeCalibrationVR:
    def __init__(self, root):
        self.root = root
        self.root.title("calibration of eyes ")
        self.root.geometry("640x480")
        self.root.configure(bg="black")

        # Canvas para desenhar a simulação VR
        self.canvas = tk.Canvas(root, width=640, height=480, bg="black", highlightthickness=0)
        self.canvas.pack()

        # Posição inicial da linha vertical
        self.x_left = 160  # Linha no lado esquerdo, que vai da direita para a esquerda
        self.x_right = 480  # Linha no lado direito, que vai da esquerda para a direita

        # Desenha as linhas que dividem o ecrã ao meio
        self.canvas.create_line(320, 0, 320, 480, fill="white")  # Linha vertical
        self.canvas.create_line(0, 240, 640, 240, fill="white")  # Linha horizontal

        # Vincular teclas de movimento
        self.root.bind("<Left>", self.move_left)
        self.root.bind("<Right>", self.move_right)

        # Atualizar visualização
        self.update_screen()

    def move_left(self, event):
        """Mover as linhas para a esquerda"""
        if self.x_left > 0 and self.x_right < 640:
            self.x_left -= 10
            self.x_right += 10

    def move_right(self, event):
        """Mover as linhas para a direita"""
        if self.x_left < 320 and self.x_right > 320:
            self.x_left += 10
            self.x_right -= 10

    def update_screen(self):
        """Atualiza a tela com as linhas e esferas em tempo real"""
        self.canvas.delete("lines")

        # Linha vertical no lado esquerdo (x vai da direita para a esquerda)
        self.canvas.create_line(self.x_left, 0, self.x_left, 480, fill="white", tags="lines")
        # Linha vertical no lado direito (x vai da esquerda para a direita)
        self.canvas.create_line(self.x_right, 0, self.x_right, 480, fill="white", tags="lines")

        # Desenhar as esferas que marcam o ponto central
        radius = 10
        self.canvas.create_oval(self.x_left - radius, 240 - radius, self.x_left + radius, 240 + radius, fill="white", tags="lines")
        self.canvas.create_oval(self.x_right - radius, 240 - radius, self.x_right + radius, 240 + radius, fill="white", tags="lines")

        # Repetir a atualização da tela
        self.root.after(50, self.update_screen)

if __name__ == "__main__":
    root = tk.Tk()
    app = EyeCalibrationVR(root)
    root.mainloop()
