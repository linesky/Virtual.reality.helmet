
import tkinter as tk

class VRBouncingBall:
    def __init__(self, root):
        self.root = root
        self.root.title("simulator VR: jumping Ball")
        self.root.geometry("640x480")
        self.root.configure(bg="black")

        # Canvas para desenhar a simulação VR
        self.canvas = tk.Canvas(root, width=640, height=480, bg="black", highlightthickness=0)
        self.canvas.pack()

        # Dividindo a tela em duas partes com uma linha branca
        self.canvas.create_line(320, 0, 320, 480, fill="white", width=2)

        # Variáveis da bola
        self.ball_radius = 15
        self.ball_x_left = 160  # Posição inicial da bola no lado esquerdo
        self.ball_y_left = 240
        self.ball_dx = 4  # Velocidade de movimento em x
        self.ball_dy = 4  # Velocidade de movimento em y
        self.ball_x_right = self.ball_x_left + 320  # Posição inicial da bola no lado direito (mesmo y, deslocada 320 px)

        # Desenha a cena inicial
        self.draw_scene()

        # Atualização constante do movimento da bola
        self.update_ball()

    def draw_scene(self):
        # Apaga a tela
        self.canvas.delete("all")

        # Linha branca que divide o ecrã em dois
        self.canvas.create_line(320, 0, 320, 480, fill="white", width=2)

        # Desenha a bola do lado esquerdo
        self.canvas.create_oval(self.ball_x_left - self.ball_radius, self.ball_y_left - self.ball_radius,
                                self.ball_x_left + self.ball_radius, self.ball_y_left + self.ball_radius,
                                fill="white")

        # Desenha a bola do lado direito
        self.canvas.create_oval(self.ball_x_right - self.ball_radius, self.ball_y_left - self.ball_radius,
                                self.ball_x_right + self.ball_radius, self.ball_y_left + self.ball_radius,
                                fill="white")

    def update_ball(self):
        # Atualiza a posição da bola
        self.ball_x_left += self.ball_dx
        self.ball_y_left += self.ball_dy
        self.ball_x_right = self.ball_x_left + 320  # Mantém a bola da direita deslocada 320 px

        # Verifica colisão com as bordas
        if self.ball_x_left - self.ball_radius <= 0 or self.ball_x_left + self.ball_radius >= 320:
            self.ball_dx = -self.ball_dx  # Inverte a direção em x

        if self.ball_y_left - self.ball_radius <= 0 or self.ball_y_left + self.ball_radius >= 480:
            self.ball_dy = -self.ball_dy  # Inverte a direção em y

        # Redesenha a cena com a nova posição da bola
        self.draw_scene()

        # Repetir a atualização a cada 20 milissegundos
        self.root.after(20, self.update_ball)

if __name__ == "__main__":
    root = tk.Tk()
    app = VRBouncingBall(root)
    root.mainloop()
