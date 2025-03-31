module ApplicationHelper
  def logged_in?
    !!session[:user_id]
  end

  def render_schedule_chart(tasks)
    content_tag :svg, width: "300", height: "300", viewBox: "0 0 300 300", xmlns: "http://www.w3.org/2000/svg" do
      # 円の背景を描画
      concat content_tag(:circle, "", cx: "150", cy: "150", r: "100", fill: "#f0f0f0")

      # タスクごとのパスを描画
      tasks.each do |task|
        position = calculate_task_position(task.start_time, task.end_time)

        # タスクの開始位置と終了位置の角度を計算（分も考慮）
        start_angle = (position[:start] - 90) * Math::PI / 180
        end_angle = (position[:end] - 90) * Math::PI / 180

        # それぞれの座標を計算
        start_x = 150 + 100 * Math.cos(start_angle)
        start_y = 150 + 100 * Math.sin(start_angle)
        end_x = 150 + 100 * Math.cos(end_angle)
        end_y = 150 + 100 * Math.sin(end_angle)

        # 円弧を描くためのフラグ（大きな円弧を描く場合）
        large_arc_flag = (position[:end] - position[:start] > 180) ? 1 : 0

        # タスクのパス描画
        path_d = <<~D
          M150,150
          L#{start_x},#{start_y}
          A100,100 0 #{large_arc_flag},1 #{end_x},#{end_y} Z
        D

        concat content_tag(:path, "", d: path_d.strip, fill: "rgba(0, 123, 255, 0.5)", stroke: "blue")
      end

      # 24時間表記のラベルを描画
      24.times do |hour|
        angle = (hour * 15) - 90 # 1時間15度で進む (0時を上に)
        x = 150 + 110 * Math.cos(angle * Math::PI / 180) # 半径+10の位置にラベル配置
        y = 150 + 110 * Math.sin(angle * Math::PI / 180)
        concat content_tag(:text, hour.to_s, x: x, y: y, "text-anchor": "middle", "alignment-baseline": "middle", "font-size": "10", fill: "black")
      end
    end
  end

  def calculate_task_position(start_time, end_time)
    return { start: 0, end: 0 } if start_time.nil? || end_time.nil?

    # 1時間15度で進み、0時が上に来るように調整
    start_angle = (start_time.hour * 15) + (start_time.min * 0.25)  # 分も考慮
    end_angle = (end_time.hour * 15) + (end_time.min * 0.25)  # 分も考慮

    # 角度が負の場合は360度を足して正の角度にする
    start_angle += 360 if start_angle < 0
    end_angle += 360 if end_angle < 0

    { start: start_angle, end: end_angle }
  end
end
