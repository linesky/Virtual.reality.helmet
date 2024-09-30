import tkinter as tk
import random

class ArkanoidVR:
    def __init__(self, root):
        self.root = root
        self.root.title("Simulação VR: Arkanoid")
        self.root.geometry("640x480")
        self.root.configure(bg="black")

        # Canvas para desenhar o jogo
        self.canvas = tk.Canvas(root, width=640, height=480, bg="black", highlightthickness=0)
        self.canvas.pack()

        # Dividindo a tela em duas partes com uma linha branca
        self.canvas.create_line(320, 0, 320, 480, fill="white", width=2)

        # Configurações do jogo
        self.paddle_width = 80
        self.paddle_height = 10
        self.paddle_speed = 20

        self.ball_radius = 10
        self.ball_speed_x = random.choice([-3, 3])
        self.ball_speed_y = -3

        # Posições iniciais
        self.paddle_x = 320 - self.paddle_width // 2
        self.paddle_y = 450

        self.ball_x = 320
        self.ball_y = 240

        # Desenha a raquete (paddle) e a bola
        self.paddle_left = self.canvas.create_rectangle(self.paddle_x, self.paddle_y, self.paddle_x + self.paddle_width, self.paddle_y + self.paddle_height, fill="white", tags="paddle_left")
        self.paddle_right = self.canvas.create_rectangle(self.paddle_x + 320, self.paddle_y, self.paddle_x + self.paddle_width + 320, self.paddle_y + self.paddle_height, fill="white", tags="paddle_right")

        self.ball_left = self.canvas.create_oval(self.ball_x - self.ball_radius, self.ball_y - self.ball_radius, self.ball_x + self.ball_radius, self.ball_y + self.ball_radius, fill="white", tags="ball_left")
        self.ball_right = self.canvas.create_oval(self.ball_x + 320 - self.ball_radius, self.ball_y - self.ball_radius, self.ball_x + 320 + self.ball_radius, self.ball_y + self.ball_radius, fill="white", tags="ball_right")

        # Vincula as teclas às funções de controle
        self.root.bind("<Left>", self.move_left)
        self.root.bind("<Right>", self.move_right)

        # Inicia o loop do jogo
        self.update_game()

    def move_left(self, event):
        """Move a raquete para a esquerda"""
        if self.paddle_x > 0:
            self.paddle_x -= self.paddle_speed

    def move_right(self, event):
        """Move a raquete para a direita"""
        if self.paddle_x + self.paddle_width < 320:
            self.paddle_x += self.paddle_speed

    def update_game(self):
        """Atualiza o estado do jogo, incluindo a posição da bola e da raquete"""
        # Atualiza a posição da bola
        self.ball_x += self.ball_speed_x
        self.ball_y += self.ball_speed_y

        # Colisão com as bordas da tela
        if self.ball_x - self.ball_radius <= 0 or self.ball_x + self.ball_radius >= 320:
            self.ball_speed_x *= -1

        if self.ball_y - self.ball_radius <= 0:
            self.ball_speed_y *= -1

        # Colisão com a raquete
        if (self.paddle_y <= self.ball_y + self.ball_radius <= self.paddle_y + self.paddle_height and
            self.paddle_x <= self.ball_x <= self.paddle_x + self.paddle_width):
            self.ball_speed_y *= -1

        # Reset se a bola cair para fora do campo
        if self.ball_y + self.ball_radius > 480:
            self.ball_x = 160
            self.ball_y = 240
            self.ball_speed_y = -3

        # Atualiza as posições no canvas
        self.canvas.coords(self.paddle_left, self.paddle_x, self.paddle_y, self.paddle_x + self.paddle_width, self.paddle_y + self.paddle_height)
        self.canvas.coords(self.paddle_right, self.paddle_x + 320, self.paddle_y, self.paddle_x + self.paddle_width + 320, self.paddle_y + self.paddle_height)

        self.canvas.coords(self.ball_left, self.ball_x - self.ball_radius, self.ball_y - self.ball_radius, self.ball_x + self.ball_radius, self.ball_y + self.ball_radius)
        self.canvas.coords(self.ball_right, self.ball_x + 320 - self.ball_radius, self.ball_y - self.ball_radius, self.ball_x + 320 + self.ball_radius, self.ball_y + self.ball_radius)

        # Chama novamente a função após 20 ms
        self.root.after(20, self.update_game)

if __name__ == "__main__":
    root = tk.Tk()
    app = ArkanoidVR(root)
    root.mainloop()

